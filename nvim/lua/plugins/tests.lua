return {
  -- {
  --   "klen/nvim-test",
  --   config = function()
  --     require('nvim-test').setup {
  --       run = true,                 -- run tests (using for debug)
  --       commands_create = true,     -- create commands (TestFile, TestLast, ...)
  --       filename_modifier = ":.",   -- modify filenames before tests run(:h filename-modifiers)
  --       silent = false,             -- less notifications
  --       term = "toggleterm",        -- a terminal to run ("terminal"|"toggleterm")
  --       termOpts = {
  --         direction = "horizontal", -- terminal's direction ("horizontal"|"vertical"|"float")
  --         height = 24,              -- terminal's height (for horizontal|float)
  --         go_back = false,          -- return focus to original window after executing
  --         stopinsert = "auto",      -- exit from insert mode (true|false|"auto")
  --         keep_one = true,          -- keep only one terminal for testing
  --       },
  --       runners = {
  --         ruby = "nvim-test.runners.rspec",
  --       }
  --     }
  --
  --     require("nvim-test.runners.rspec"):setup {
  --       command = "project bin/rspec"
  --     }
  --   end
  -- },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "olimorris/neotest-rspec",
      "nvim-neotest/neotest-go",
    },
    config = function()
      require("neotest").setup({
        discovery = {
          concurrent = 0,
          enabled = true,
        },
        summary = {
          open = "botright split"
        },
        adapters = {
          require("neotest-rspec"),
          require("neotest-go"),
        },
      })
    end,
    keys = {
      { "<leader>tn", function() require("neotest").run.run() end,                       desc = "Run tests" },
      { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end,     desc = "Run tests in current file" },
      { "<leader>td", function() require("neotest").run.run(vim.fn.expand("%:p:h")) end, desc = "Run tests in current directory" },
      { "<leader>tt", function() require("neotest").run.run_last() end,                  desc = "Run last test" },
      { "<leader>ts", function() require("neotest").run.run(vim.fn.getcwd()) end,        desc = "Run all tests" },
      { "<leader>tl", function() require("neotest").summary.toggle() end,                desc = "Open tests summary" },
    },
  }
}
