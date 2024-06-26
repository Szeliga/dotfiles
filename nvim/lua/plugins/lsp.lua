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
      { 'b0o/schemastore.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },         -- Required
      { 'hrsh7th/cmp-nvim-lsp' },     -- Required
      { 'hrsh7th/cmp-buffer' },       -- Optional
      { 'hrsh7th/cmp-path' },         -- Optional
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      { 'hrsh7th/cmp-nvim-lua' },     -- Optional
      { "supermaven-inc/supermaven-nvim" },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },             -- Required
      { 'rafamadriz/friendly-snippets' }, -- Optional
    },
    config = function()
      require("supermaven-nvim").setup({
        ignore_filetypes = { cpp = true },
        disable_inline_completion = true, -- disables inline completion for use with cmp
        disable_keymaps = true -- disables built in keymaps for more manual control
      })

      local lsp = require('lsp-zero').preset({
        name = 'minimal',
        set_lsp_keymaps = { preserve_mappings = false },
        manage_nvim_cmp = true,
        suggest_lsp_servers = false,
      })

      -- (Optional) Configure lua language server for neovim
      lsp.nvim_workspace()

      lsp.format_on_save({
        format_opts = {
          async = true,
          timeout_ms = 10000,
        },
        servers = {
          ['lua_ls'] = { 'lua' },
          ['rubocop'] = { 'ruby' },
        }
      })

      lsp.on_attach(function(client, bufnr)
        if client.server_capabilities.documentSymbolProvider then
          require("nvim-navic").attach(client, bufnr)
        end
      end)

      lsp.configure("rubocop", {
        cmd = { "rvm", ".", "do", "rubocop", "--lsp" }
      })
      lsp.configure("solargraph", {
        cmd = { "rvm", ".", "do", "solargraph", "stdio" },
        settings = {
          solargraph = {
            diagnostics = false,
            format = false,
            autoformat = false,
            formatting = false,
          },
        },
        init_options = {
          diagnostics = false,
          format = false,
          autoformat = false,
          formatting = false,
        },
      })

      lsp.setup_servers({
        "grammarly",
        "solargraph",
        "rubocop",
        force = true,
      })

      local schemastore = require('schemastore')
      local lspconfig = require('lspconfig')
      lspconfig.jsonls.setup({
        settings = {
          json = {
            schemas = schemastore.json.schemas {
              extra = {
                {
                  description = 'OpenAPI Qonto',
                  fileMatch = 'openapi*.yml',
                  name = 'openapi.json',
                  url = "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json",
                  versions = {
                    ["3.0"] = "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.0/schema.json",
                    ["3.1"] = "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"
                  }
                },
                {
                  description = 'Docker Compose Qonto',
                  fileMatch = { 'qonto-env-compose.yml', 'qonto-env-compose.yaml' },
                  name = 'docker-compose.yml',
                  url = 'https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json',
                },
              }
            },
            validate = { enable = true },
          },
        },
      })
      lspconfig.yamlls.setup({
        settings = {
          yaml = {
            schemaStore = {
              -- You must disable built-in schemaStore support if you want to use
              -- this plugin and its advanced options like `ignore`.
              enable = false,
            },
            schemas = schemastore.yaml.schemas {
              extra = {
                {
                  description = 'OpenAPI Qonto',
                  fileMatch = 'openapi*.yml',
                  name = 'openapi.json',
                  url = "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json",
                  versions = {
                    ["3.0"] = "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.0/schema.json",
                    ["3.1"] = "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"
                  }
                },
                {
                  description = 'Docker Compose Qonto',
                  fileMatch = { 'qonto-env-compose.yml', 'qonto-env-compose.yaml' },
                  name = 'docker-compose.yml',
                  url = 'https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json',
                },
              }
            },
          },
        },
      })

      lsp.setup_nvim_cmp({
        sources = {
          { name = 'path' },
          { name = 'luasnip',  keyword_length = 2 },
          { name = 'supermaven' },
          { name = 'nvim_lsp', keyword_length = 1 },
          { name = 'buffer',   keyword_length = 2 },
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

      local cmp = require('cmp')
      local cmp_action = require('lsp-zero').cmp_action()
      cmp.setup({
        mapping = {
          ['<Tab>'] = cmp_action.luasnip_supertab(),
          ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
        }
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
