local set = vim.keymap.set

set("n", "<leader>mp", require("utils.markdown").preview, { desc = "Open file preview in Marked", silent = true })
