return {
  "CRAG666/code_runner.nvim",
  config = function()
    require("code_runner").setup({
      mode = "term",
      focus = true,
      startinsert = true,
      -- float = {
      --   border = "rounded",
      -- },
      filetype = {
        python = "python3 -u",
        cpp = "g++ $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
        javascript = "node",
        java = "javac $fileName && java $fileNameWithoutExt",
      },
    })
  end,
}
