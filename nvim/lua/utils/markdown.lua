local M = {}

function M.preview()
  local path = vim.fn.expand("%:.")
  os.execute("open -a \"Marked 2\" " .. path)
  vim.fn.jobstart({ "open", "-a", "\"Marked 2\"", path })
end

return M
