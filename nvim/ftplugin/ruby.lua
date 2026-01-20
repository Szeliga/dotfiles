local set = vim.keymap.set
set("n", "<leader>z", ":g/it \"/normal! zc<CR>", { desc = "Fold tests", silent = true })
