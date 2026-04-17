return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "TSUpdate",
        callback = function()
          require("nvim-treesitter.parsers").plantuml = {
            tier = 2,
            install_info = {
              url = "https://github.com/Szeliga/tree-sitter-plantuml",
              revision = "master",
            },
          }
          require("nvim-treesitter.parsers").gotmpl = {
            tier = 2,
            install_info = {
              url = "https://github.com/ngalaiko/tree-sitter-go-template",
              revision = "main",
            },
          }
        end,
      })

      vim.treesitter.language.register("gotmpl", { "gohtmltmpl", "gotexttmpl", "gotmpl", "yaml" })

      require("nvim-treesitter").install({
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
        "plantuml",
        "regex",
        "ruby",
        "sql",
        "terraform",
        "vim",
        "yaml",
      })

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local ft = args.match
          local lang = vim.treesitter.language.get_lang(ft) or ft
          local ok = pcall(vim.treesitter.language.inspect, lang)
          if ok then
            vim.treesitter.start()
          end
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    config = function()
      require("nvim-treesitter-textobjects").setup {
        move = {
          -- whether to set jumps in the jumplist
          set_jumps = true,
        },
      }
    end,
    keys = {
      { "]f", function() require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects") end,     desc = "Next function" },
      { "[f", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects") end, desc = "Next function" },
    },
  },
}
