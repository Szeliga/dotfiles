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
      parser_config.gotmpl = {
        install_info = {
          url = "https://github.com/ngalaiko/tree-sitter-go-template",
          files = { "src/parser.c" }
        },
        filetype = "gotmpl",
        used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", "yaml" }
      }

      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "diff",
          "dockerfile",
          "git_rebase",
          "gitattributes",
          "gitcommit",
          "gitignore",
          "go",
          "gomod",
          "gosum",
          "graphql",
          "json",
          "lua",
          "make",
          "markdown",
          "pkl",
          "plantuml",
          "regex",
          "ruby",
          "sql",
          "terraform",
          "vim",
          "yaml",
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
  },
  {
    "apple/pkl-neovim",
    lazy = true,
    event = "BufReadPre *.pkl",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    build = function()
      vim.cmd("TSInstall! pkl")
    end,
  }
}
