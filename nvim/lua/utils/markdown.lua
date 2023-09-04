local M = {}

function M.preview()
  local path = vim.fn.expand("%:p")
  print("\"x-marked://open?file=" .. path .. "\"")
  vim.fn.jobstart("open \"x-marked://open?file=" .. path .. "\"")
end

return M
