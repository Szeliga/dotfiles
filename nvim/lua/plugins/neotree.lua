return {
  "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "<leader>e",
        function()
          vim.cmd("NeoTreeRevealToggle")
        end
        ,
        desc = "NeoTree"
      },
    },
    config = function()
      require("neo-tree").setup()
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
} 
