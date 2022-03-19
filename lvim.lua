--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
local colorscheme = "kanagawa"
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = colorscheme
-- vim.g.material_style = "oceanic"

lvim.builtin.dap.active = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = ","
-- add your own keymapping
lvim.keys.normal_mode["<leader>q"] = ""
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<leader>f"] = ":Telescope find_files<cr>"
lvim.keys.normal_mode[";"] = ":Telescope buffers<cr>"
lvim.keys.normal_mode["<space>"] = ":noh<cr>"
lvim.keys.normal_mode["<leader>w"] = ":w<CR>"
lvim.keys.normal_mode["<leader>a"] = ":Telescope grep_string<CR>"
lvim.keys.normal_mode["<leader>q"] = ":BufferClose<CR>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
    ["<esc>"] = actions.close,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "css",
  "java",
  "javascript",
  "json",
  "lua",
  "python",
  "ruby",
  "rust",
  "typescript",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.indent.enable = false

-- generic LSP settings

-- ---@usage disable automatic installation of servers
lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration

-- require('lspconfig').spectral_ls.setup{
--   cmd = { "spectral-language-server", "--stdio" },
--   filetypes = { "yaml", "json", "yml" },
--   settings = {
--     enable = true,
--     run = "onType",
--     validateLanguages = { "yaml", "json", "yml" }
--   },
--   single_file_support = true
-- }

-- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("spectral_ls", opts)

-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    exe = "standardrb",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    args = { "--fix" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "ruby" },
  },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { exe = "standardrb", filetypes = { "ruby" } },
  -- { exe = "flake8", filetypes = { "python" } },
  -- {
  --   exe = "shellcheck",
  --   ---@usage arguments to pass to the formatter
  --   -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --   args = { "--severity", "warning" },
  -- },
  -- {
  --   exe = "codespell",
  --   ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --   filetypes = { "javascript", "python" },
  -- },
}

-- Additional Plugins
lvim.plugins = {
  {"ellisonleao/glow.nvim"},
  {"folke/tokyonight.nvim"},
  {"lukas-reineke/indent-blankline.nvim"},
  {"mhartington/oceanic-next"},
  {"onemanstartup/vim-slim"},
  {"sQVe/sort.nvim"},
  {"tpope/vim-surround"},
  {"micmine/jumpwire.nvim"},
  {"tpope/vim-projectionist"},
  { "jbyuki/instant.nvim" },
  {
    "rmagatti/auto-session",
    config = function()
      require('auto-session').setup {
        log_level = 'info',
        auto_session_suppress_dirs = {"~/.config/lvim/sessions"}
      }
    end
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require "lsp_signature".setup()
    end
  },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  { "EdenEast/nightfox.nvim" },
  { "rebelot/kanagawa.nvim" },
}

require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
      },
    },
  },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

lvim.builtin.lualine.sections.lualine_z = {require("lvim.core.lualine.components").scrollbar, require('auto-session-library').current_session_name}
lvim.builtin.lualine.theme = colorscheme


vim.g.tokyonight_style = "night"
vim.g.instant_username = "szymon"
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.grepprg = "rg --vimgrep --no-heading --smart-case"
vim.o.grepformat = "%f:%l:%c:%m"
require'lspconfig'.ltex.setup{
  cmd = { "/home/dev/.local/share/nvim/lsp_servers/ltex/ltex-ls/bin/ltex-ls" },
}

local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()