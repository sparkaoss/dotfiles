return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        direction = "float",
        start_in_insert = true,
        shade_terminals = false,
        float_opts = {
          border = "curved",
          width = 125,
          height = 40,
        },
        size = function(term)
          return term.direction == "float" and 20 or 15
        end,
      })
    end,
  },
}
