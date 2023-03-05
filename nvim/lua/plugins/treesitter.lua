return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "vim", "help", "ruby", "yaml", "json", "markdown", "go", "gomod", "gosum", "graphql", "make", "regex", "sql", "terraform", "bash", "dockerfile", "diff", "gitcommit", "gitignore", "git_rebase", "gitattributes" },
        sync_install = true,
        auto_install = true,
        highlight = {
          enable = true,
        },
      })
    end,
  },
  {
    "nvim-treesitter/playground"
  }
}
