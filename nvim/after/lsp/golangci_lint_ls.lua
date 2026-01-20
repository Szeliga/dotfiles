-- Uses default settings, will respect .golangci.yml if present
return {
  cmd = { 'golangci-lint-langserver' },
  filetypes = { 'go', 'gomod' },
}
