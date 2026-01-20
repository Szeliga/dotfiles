return {
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
  { 'b0o/schemastore.nvim', lazy = true, version = false },
  { 'SmiteshP/nvim-navic' },

  {
    -- Enable native LSP servers
    name = "native-lsp-enable",
    dir = vim.fn.stdpath("config"),
    config = function()
      -- Register configurations for each LSP server
      local lsp_config_dir = vim.fn.stdpath("config") .. "/after/lsp"
      local servers = {
        'lua_ls',
        'gopls',
        'graphql',
        'golangci_lint_ls',
        'harper_ls',
        'jsonls',
        'yamlls',
        'ruby_lsp',
        'rubocop',
        'protols',
        'buf_ls',
        'nil_ls',
      }

      for _, server in ipairs(servers) do
        local config_file = lsp_config_dir .. "/" .. server .. ".lua"
        local ok, config = pcall(dofile, config_file)
        if ok and config then
          vim.lsp.config(server, config)
        end
      end

      -- Enable all LSP servers
      vim.lsp.enable(servers)
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' }, -- Optional
      { 'hrsh7th/cmp-path' },   -- Optional
    },
    config = function()
      local cmp = require('cmp')

      cmp.setup({
        sources = {
          { name = 'supermaven', keyword_length = 0 },
          { name = "lazydev" },
          { name = 'nvim_lsp',   keyword_length = 1 },
          { name = 'path' },
          { name = 'buffer',     keyword_length = 2 },
        },
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
          -- Super tab
          ['<Tab>'] = cmp.mapping(function(fallback)
            local col = vim.fn.col('.') - 1

            if cmp.visible() then
              cmp.select_next_item({ behavior = 'select' })
            elseif vim.snippet.active({ direction = 1 }) then
              vim.snippet.jump(1)
            elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
              fallback()
            else
              cmp.complete()
            end
          end, { 'i', 's' }),

          -- Super shift tab
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item({ behavior = 'select' })
            elseif vim.snippet.active({ direction = -1 }) then
              vim.snippet.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
      })
    end,
  },
  {
    'echasnovski/mini.doc',
    lazy = false,
    version = '*',
    config = function()
      require("mini.doc").setup({})
    end
  }
}
