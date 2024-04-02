return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
      parser_config.plantuml = {
        install_info = {
          url = "https://github.com/Szeliga/tree-sitter-plantuml", -- local path or git repo
          files = { "src/parser.c" },                              -- note that some parsers also require src/scanner.c or src/scanner.cc
          branch = "master",
        },
        filetype = "plantuml", -- if filetype does not match the parser name
      }

      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua",
          "vim",
          "ruby",
          "yaml",
          "json",
          "markdown",
          "go",
          "gomod",
          "gosum",
          "graphql",
          "make",
          "regex",
          "sql",
          "terraform",
          "bash",
          "dockerfile",
          "diff",
          "gitcommit",
          "gitignore",
          "git_rebase",
          "gitattributes",
          "plantuml"
        },
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
