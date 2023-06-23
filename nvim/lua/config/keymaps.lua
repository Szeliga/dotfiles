local telescope = require("telescope.builtin")
local spectre = require("spectre")
local set = vim.keymap.set
local dap = require('dap')
local treesj = require('treesj')

-- Telescope
set("n", "<leader>ff", telescope.find_files, { desc = "Find files", silent = true })
set("n", "<leader>fs", telescope.live_grep, { desc = "Grep in project", silent = true })
set("n", "<leader>fb", telescope.buffers, { desc = "Find buffers", silent = true })
set("n", "<leader>fm", telescope.marks, { desc = "Find marks", silent = true })
set("n", "<leader>fq", telescope.quickfix, { desc = "Find quickfix items", silent = true })
set("n", "<leader>fg", telescope.git_status, { desc = "Find modified git files", silent = true })
set("n", "<leader>fd", telescope.lsp_document_symbols, { desc = "Show current file LSP symbols", silent = true })
set("n", "<leader><leader>", function() vim.cmd("Telescope") end, { desc = "Open Telescope", silent = true })

-- Nvim-tree
set("n", "<leader>e", function() vim.cmd("NvimTreeFindFileToggle") end, { desc = "Open file browser", silent = true })

-- Utility
set("n", "H", ":BufferLineCyclePrev<cr>", { desc = "Previous buffer", silent = true })
set("n", "L", ":BufferLineCycleNext<cr>", { desc = "Next buffer", silent = true })
set("n", "<leader>c", ":bd<cr>", { desc = "Close buffer", silent = true })
set("n", " ", ":nohlsearch<cr>", { desc = "Clear search highlight", silent = true })
set(
  "n",
  "<leader>C",
  function()
    local path = vim.fn.expand("%:.")
    vim.fn.setreg("+", path)
    print("Copied " .. path .. " to clipboard")
  end,
  { desc = "Copy current file relative path to clipboard", silent = true }
)
set("n", "<leader>F", function() vim.cmd("LspZeroFormat") end, { desc = "Format current file using LSP", silent = true })
set("t", "<ESC><ESC>", "<c-\\><c-n>", { desc = "Exit insert mode in terminal", silent = true })
set("n", "<leader>j", treesj.toggle, { desc = "Split/Join object", silent = true })
set("n", "<leader>w", ":w<CR>", { desc = "Save", silent = true })
set("i", "<leader>w", "<ESC>:w<CR>", { desc = "Save", silent = true })

-- Testing
set("n", "<leader>tt", function() vim.cmd("TestLast") end, { desc = "Run last tests", silent = true })
set("n", "<leader>tf", function() vim.cmd("TestFile") end, { desc = "Run current file tests", silent = true })
set("n", "<leader>tn", function() vim.cmd("TestNearest") end, { desc = "Run nearest test", silent = true })
set("n", "<leader>ts", function() vim.cmd("TestSuite") end, { desc = "Run suite tests", silent = true })
set("n", "gt", function() vim.cmd("Other") end, { desc = "Go to test/implementation", silent = true })

-- Debugging
set("n", "<leader>bb", function() dap.toggle_breakpoint() end, { desc = "Toggle breakpoint", silent = true })
set("n", "<leader>bc", function() dap.toggle_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
  { desc = "Toggle conditional breakpoint", silent = true })
set("n", "<leader>dc", function() dap.continue() end, { desc = "Run debugger", silent = true })
set("n", "<leader>dl", function() dap.run_last() end, { desc = "Run last debugger", silent = true })
set("n", "<leader>dn", function() dap.step_over() end, { desc = "Debugger step over", silent = true })
set("n", "<leader>db", function() dap.step_back() end, { desc = "Debugger step back", silent = true })
set("n", "<leader>di", function() dap.step_into() end, { desc = "Debugger step into", silent = true })
set("n", "<leader>do", function() dap.step_out() end, { desc = "Debugger step out", silent = true })

-- Search and Replace
set("n", "<leader>ss", function() spectre.open() end, { desc = "Find and replace in project", silent = true })
set("v", "<leader>ss", function() spectre.open_visual() end,
  { desc = "Find and replace current selection in project", silent = true })
set("n", "<leader>sw", function() spectre.open_visual({ select_word = true }) end,
  { desc = "Find and replace current word in project", silent = true })
set("n", "<leader>sf", function() spectre.open_file_search() end, { desc = "Find and replace in file", silent = true })

-- Folding
set('n', 'zR', require('ufo').openAllFolds)
set('n', 'zM', require('ufo').closeAllFolds)
