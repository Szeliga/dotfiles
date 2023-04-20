return {
  {
    "folke/neodev.nvim",
    config = true,
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional
      { 'SmiteshP/nvim-navic' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },         -- Required
      { 'hrsh7th/cmp-nvim-lsp' },     -- Required
      { 'hrsh7th/cmp-buffer' },       -- Optional
      { 'hrsh7th/cmp-path' },         -- Optional
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      { 'hrsh7th/cmp-nvim-lua' },     -- Optional

      -- Snippets
      { 'L3MON4D3/LuaSnip' },             -- Required
      { 'rafamadriz/friendly-snippets' }, -- Optional
    },
    config = function()
      local lsp = require('lsp-zero').preset({
        name = 'minimal',
        set_lsp_keymaps = { preserve_mappings = false },
        manage_nvim_cmp = true,
        suggest_lsp_servers = false,
      })

      -- (Optional) Configure lua language server for neovim
      lsp.nvim_workspace()

      local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
      local lsp_format_on_save = function(bufnr)
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format()
          end,
        })
      end
      lsp.on_attach(function(client, bufnr)
        if client.server_capabilities.documentSymbolProvider then
          require("nvim-navic").attach(client, bufnr)
        end
        lsp_format_on_save(bufnr)
      end)

      lsp.setup_servers({ "grammarly", force = true })

      lsp.configure("solargraph", {
        settings = {
          solargraph = {
            diagnostics = false
          }
        },
        init_options = {
          formatting = false
        }
      })

      lsp.setup_nvim_cmp({
        sources = {
          { name = 'path' },
          { name = 'nvim_lsp', keyword_length = 1 },
          { name = 'buffer',   keyword_length = 2 },
          { name = 'luasnip',  keyword_length = 2 },
        }
      })

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = false,
        float = true,
      })

      lsp.setup()
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
