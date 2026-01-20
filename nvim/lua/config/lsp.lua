-- Set default capabilities for all LSP servers
vim.lsp.config('*', {
  capabilities = require('cmp_nvim_lsp').default_capabilities()
})

vim.api.nvim_create_autocmd('LspAttach', {
  desc = "Enable inlay hints",
  callback = function(event)
    local buf = event.buf
    local id = vim.tbl_get(event, 'data', 'client_id')
    local client = id and vim.lsp.get_client_by_id(id)

    if client == nil then
      return
    end

    if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = buf })
    end
  end
})

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gd', function() require('telescope.builtin').lsp_definitions() end, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', function() require('telescope.builtin').lsp_implementations() end, opts)
    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gr', function() require('telescope.builtin').lsp_references() end, opts)
    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format({ async = true }) end, opts)
    vim.keymap.set({ 'n', 'v' }, '<F4>', vim.lsp.buf.code_action, opts)
  end,
})

local buffer_autoformat = function(bufnr)
  local group = 'lsp_autoformat'
  vim.api.nvim_create_augroup(group, { clear = false })
  vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })

  vim.api.nvim_create_autocmd('BufWritePre', {
    buffer = bufnr,
    group = group,
    desc = 'LSP format on save',
    callback = function()
      -- note: do not enable async formatting
      vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
    end,
  })
end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local id = vim.tbl_get(event, 'data', 'client_id')
    local client = id and vim.lsp.get_client_by_id(id)
    if client == nil then
      return
    end

    -- make sure there is at least one client with formatting capabilities
    if client.supports_method('textDocument/formatting') then
      buffer_autoformat(event.buf)
    end
  end
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local id = vim.tbl_get(event, 'data', 'client_id')
    local client = id and vim.lsp.get_client_by_id(id)
    if client == nil then
      return
    end
    if client.server_capabilities.documentSymbolProvider then
      require("nvim-navic").attach(client, event.buf)
    end
  end,
})


vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})

-- Add :LspInfo command for checking LSP status
vim.api.nvim_create_user_command('LspInfo', function()
  local clients = vim.lsp.get_clients({ bufnr = 0 })

  if #clients == 0 then
    print('No LSP clients attached to current buffer')
    return
  end

  print('LSP clients attached to buffer ' .. vim.api.nvim_get_current_buf() .. ':')
  for _, client in ipairs(clients) do
    print(string.format('  - %s (id: %d)', client.name, client.id))
    if client.root_dir then
      print(string.format('    root_dir: %s', client.root_dir))
    end
  end

  -- Also show all active clients globally
  local all_clients = vim.lsp.get_clients()
  if #all_clients > #clients then
    print('\nOther active LSP clients:')
    for _, client in ipairs(all_clients) do
      local is_current = false
      for _, c in ipairs(clients) do
        if c.id == client.id then
          is_current = true
          break
        end
      end
      if not is_current then
        print(string.format('  - %s (id: %d)', client.name, client.id))
      end
    end
  end
end, { desc = 'Show LSP client information' })
