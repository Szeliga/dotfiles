return {
  {
    "akinsho/bufferline.nvim",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("bufferline").setup({
        options = {
          offsets = {
            {
              filetype = "neo-tree",
              text = "File Explorer",
              highlight = "Directory",
              separator = true -- use a "true" to enable the default, or set your own character
            }
          },
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
              local sym = e == "error" and " "
                  or (e == "warning" and " " or "")
              s = s .. n .. sym
            end
            return s
          end
        },
      })
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      local navic = require("nvim-navic")
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = true,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          }
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { { navic.get_location, cond = navic.is_available } },
          lualine_x = {
            'encoding', 'fileformat', 'filetype'
          },
          lualine_y = {
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = { fg = "#ff9e64" },
            },
            'progress'
          },
          lualine_z = { 'location' }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      })
    end,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'arkav/lualine-lsp-progress',
      'SmiteshP/nvim-navic',
    }
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = false,
      }
    end,
  },
  "lewis6991/gitsigns.nvim",
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },
}
