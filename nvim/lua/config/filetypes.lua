vim.filetype.add({
  extension = {
    avsc = "json",
    puml = "plantuml",
  },
})

vim.filetype.add({
  extension = {
    gotmpl = 'gotmpl',
  }
})

vim.filetype.add({
  pattern = {
    ["*.go.golden"] = "go",
  },
})
