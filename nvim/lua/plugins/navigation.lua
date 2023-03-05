return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    'echasnovski/mini.bracketed',
    config = function()
      require("mini.bracketed").setup()
    end,
    version = false
  },
}
