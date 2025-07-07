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
  { 'SmiteshP/nvim-navic' },

  {
    'neovim/nvim-lspconfig',
    config = function()
      -- local devenv = require("devenv")
      local cfg = require 'go.lsp'.config() -- config() return the go.nvim gopls setup
      table.insert(cfg, { inlay_hints = true })
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            hint = {
              enable = true, -- necessary
            }
          }
        }
      })
      lspconfig.gopls.setup({
        settings = {
          gopls = {
            env = { GOFLAGS = "-tags=functional" }
          }
        }
      })
      lspconfig.graphql.setup({
        filetypes = { "graphql", "javascript", "typescript", "javascriptreact", "typescriptreact" },
      })
      -- lspconfig.marksman.setup({})
      -- lspconfig.golangci_lint_ls.setup({})
      lspconfig.grammarly.setup({})
      lspconfig.rubocop.setup({
        cmd = { "/Users/szymon.szeliga.ext/.rvm/gems/ruby-3.3.6@global/wrappers/rubocop", "--lsp" }
      })
      -- lspconfig.steep.setup({})
      lspconfig.jsonls.setup({})
      lspconfig.yamlls.setup({})
      lspconfig.ruby_lsp.setup({
        -- cmd = devenv.lsp_cmd({ "ruby-lsp" }),
        init_options = {
          enabledFeatures = {
            codeActions = true,
            codeLens = true,
            completion = true,
            definition = true,
            diagnostics = true,
            documentHighlights = true,
            documentLink = true,
            documentSymbols = true,
            foldingRanges = true,
            formatting = true,
            hover = true,
            inlayHint = true,
            onTypeFormatting = true,
            selectionRanges = true,
            semanticHighlighting = true,
            signatureHelp = true,
            typeHierarchy = true,
            workspaceSymbol = true
          },
          featuresConfiguration = {
            inlayHint = {
              implicitHashValue = true,
              implicitRescue = true
            }
          },
          experimentalFeaturesEnabled = false,
          linters = { "" },
          formatters = { "" },
        }
      })

      -- lspconfig.protols.setup({})
      lspconfig.buf_ls.setup({})
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' }, -- Optional
      { 'hrsh7th/cmp-path' },   -- Optional
      { 'L3MON4D3/LuaSnip' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'rafamadriz/friendly-snippets' },
    },
    config = function()
      local cmp = require('cmp')
      require('luasnip.loaders.from_vscode').lazy_load()


      cmp.setup({
        sources = {
          { name = 'supermaven', keyword_length = 0 },
          { name = "lazydev" },
          { name = 'nvim_lsp',   keyword_length = 1 },
          { name = 'luasnip',    keyword_length = 2 },
          { name = 'path' },
          { name = 'buffer',     keyword_length = 2 },
        },
        snippet = {
          expand = function(args)
            -- You need Neovim v0.10 to use vim.snippet
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
          -- Super tab
          ['<Tab>'] = cmp.mapping(function(fallback)
            local luasnip = require('luasnip')
            local col = vim.fn.col('.') - 1

            if cmp.visible() then
              cmp.select_next_item({ behavior = 'select' })
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
              fallback()
            else
              cmp.complete()
            end
          end, { 'i', 's' }),

          -- Super shift tab
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            local luasnip = require('luasnip')

            if cmp.visible() then
              cmp.select_prev_item({ behavior = 'select' })
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
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
