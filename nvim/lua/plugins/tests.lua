return {
  {
    "klen/nvim-test",
    config = function()
      require('nvim-test').setup {
        run = true,                 -- run tests (using for debug)
        commands_create = true,     -- create commands (TestFile, TestLast, ...)
        filename_modifier = ":.",   -- modify filenames before tests run(:h filename-modifiers)
        silent = false,             -- less notifications
        term = "toggleterm",        -- a terminal to run ("terminal"|"toggleterm")
        termOpts = {
          direction = "horizontal", -- terminal's direction ("horizontal"|"vertical"|"float")
          height = 24,              -- terminal's height (for horizontal|float)
          go_back = false,          -- return focus to original window after executing
          stopinsert = "auto",      -- exit from insert mode (true|false|"auto")
          keep_one = true,          -- keep only one terminal for testing
        },
        runners = {
          ruby = "nvim-test.runners.rspec",
        }
      }

      require("nvim-test.runners.rspec"):setup {
        command = "bin/project bundle exec rspec"
      }
    end
  }
}
