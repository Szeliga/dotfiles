return {
  {
    "akinsho/toggleterm.nvim",
    lazy = false,
    config = function()
      require("toggleterm").setup({
        shade_terminals = false,
        open_mapping = [[<c-`>]],
        hide_numbers = true,
        direction = "float",
        float_opts = {
          border = "rounded"
        },
        winbar = {
          enabled = true,
          name_formatter = function(term) --  term: Terminal
            return term.name
          end
        },
      })
    end
  }
}
