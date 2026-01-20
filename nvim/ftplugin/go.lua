local set = vim.keymap.set
set("n", "<leader>z", ":g/func/normal! zc<CR>", { desc = "Fold tests", silent = true })
