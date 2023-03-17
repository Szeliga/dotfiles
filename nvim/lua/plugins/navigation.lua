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
  {
    "rgroli/other.nvim",
    lazy = false,
    cmd = "Other",
    config = function()
      require("other-nvim").setup({
        mappings = {
          {
            pattern = "/app/(.*)/(.*).rb",
            target = {
              { context = "test", target = "/spec/%1/%2_spec.rb" },
            },
          },
          {
            pattern = "/spec/(.*)/(.*)_spec.rb",
            target = {
              { context = "implementation", target = "/app/%1/%2.rb" },
            },
          },
          {
            pattern = "/lib/(.*)/(.*).rb",
            target = {
              { context = "test", target = "/spec/lib/%1/%2_spec.rb" },
            },
          },
          {
            pattern = "/spec/lib/(.*)/(.*)_spec.rb",
            target = {
              { context = "test", target = "/lib/%1/%2.rb" },
            },
          },
        }
      })
    end
  }
}
