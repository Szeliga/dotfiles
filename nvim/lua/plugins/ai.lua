return {

  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        ignore_filetypes = { cpp = true },
        disable_inline_completion = true, -- disables inline completion for use with cmp
        disable_keymaps = true            -- disables built in keymaps for more manual control
      })
    end,
  },
  {
    "greggh/claude-code.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for git operations
    },
    config = function()
      require("claude-code").setup(
        {
          -- Terminal window settings
          window = {
            split_ratio = 0.4,      -- Percentage of screen for the terminal window (height for horizontal, width for vertical splits)
            position = "vertical",  -- Position of the window: "botright", "topleft", "vertical", "rightbelow vsplit", etc.
            enter_insert = true,    -- Whether to enter insert mode when opening Claude Code
            hide_numbers = true,    -- Hide line numbers in the terminal window
            hide_signcolumn = true, -- Hide the sign column in the terminal window
          },
          -- File refresh settings
          refresh = {
            enable = true,             -- Enable file change detection
            updatetime = 100,          -- updatetime when Claude Code is active (milliseconds)
            timer_interval = 1000,     -- How often to check for file changes (milliseconds)
            show_notifications = true, -- Show notification when files are reloaded
          },
          -- Git project settings
          git = {
            use_git_root = true, -- Set CWD to git root when opening Claude Code (if in git project)
          },
          -- Command settings
          command = "claude", -- Command used to launch Claude Code
          -- Command variants
          command_variants = {
            -- Conversation management
            continue = "--continue", -- Resume the most recent conversation
            resume = "--resume",     -- Display an interactive conversation picker

            -- Output options
            verbose = "--verbose", -- Enable verbose logging with full turn-by-turn output
          },
          -- Keymaps
          keymaps = {
            toggle = {
              normal = "<leader>aa",     -- Normal mode keymap for toggling Claude Code, false to disable
              terminal = "<leader>aa",   -- Terminal mode keymap for toggling Claude Code, false to disable
              variants = {
                continue = "<leader>ac", -- Normal mode keymap for Claude Code with continue flag
                verbose = "<leader>av",  -- Normal mode keymap for Claude Code with verbose flag
                resume = "<leader>ar",   -- Normal mode keymap for Claude Code with resume flag
              },
            },
            window_navigation = true, -- Enable window navigation keymaps (<C-h/j/k/l>)
            scrolling = true,         -- Enable scrolling keymaps (<C-f/b>) for page up/down
          }
        }
      )
    end
  }
}
