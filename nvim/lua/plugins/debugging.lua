return {
  {
    "mfussenegger/nvim-dap",
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup({
        layouts = {
          {
            elements = {
              {
                id = "scopes",
                size = 0.25
              },
              {
                id = "breakpoints",
                size = 0.25
              },
              {
                id = "stacks",
                size = 0.25
              },
              {
                id = "watches",
                size = 0.25
              }
            },
            position = "left",
            size = 50
          },
          {
            elements = {
              {
                id = "repl",
                size = 0.5
              },
              {
                id = "console",
                size = 0.5
              }
            },
            position = "bottom",
            size = 15
          }
        },
      })

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    }
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = true,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "mfussenegger/nvim-dap",
    }
  },
  {
    "leoluz/nvim-dap-go",
    config = function()
      require('dap-go').setup {
        dap_configurations = {
          {
            type = "go",
            name = "Test (Functional)",
            request = "launch",
            program = "${file}",
            mode = "test",
            buildFlags = "-tags=functional",
            cwd = "./functionaltests",
          },
        },
      }
    end,
  },
}
