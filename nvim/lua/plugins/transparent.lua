return {
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function()
      require("transparent").setup({
        extra_groups = {
          "NormalFloat",
          "FloatBorder",
          "SnacksPicker",
          "SnacksLayoutBox",
          "ToggleTerm",
          "TermNormal",
          "Normal",
        },
      })
      -- require("transparent").clear_prefix("Snacks")
      -- require("transparent").clear_prefix("BufferLine")
      -- require("transparent").clear_prefix("lualine")
    end,
  },
}
