return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      { dir = "~/coding/tree-sitter-plantuml/" }
    },
    config = function()
      local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
      parser_config.plantuml = {
        install_info = {
          url = "~/coding/tree-sitter-plantuml/", -- local path or git repo
          files = { "src/parser.c" },             -- note that some parsers also require src/scanner.c or src/scanner.cc
          -- optional entries:
          branch = "gh-page",                     -- default branch in case of git repo if different from master
          generate_requires_npm = false,          -- if stand-alone parser without npm dependencies
          requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
        },
        filetype = "plantuml",                    -- if filetype does not match the parser name
      }

      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua",
          "vim",
          "help",
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
