-- Uses default settings, will respect buf.yaml if present
return {
  cmd = { 'buf', 'lsp', 'serve' },
  filetypes = { 'proto' },
}
