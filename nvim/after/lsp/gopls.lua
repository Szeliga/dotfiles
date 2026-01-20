-- Get gopls config from go.nvim which includes optimized settings
local go_lsp = require('go.lsp')
local config = go_lsp.config()

-- Add required fields for native Neovim LSP
config.cmd = config.cmd or { 'gopls' }
config.filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' }

-- Preserve our custom GOFLAGS for functional tests
config.settings = config.settings or {}
config.settings.gopls = config.settings.gopls or {}
config.settings.gopls.env = vim.tbl_extend('force', config.settings.gopls.env or {}, {
  GOFLAGS = "-tags=functional"
})

return config
