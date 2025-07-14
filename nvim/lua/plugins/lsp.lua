return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = {
        "html",
        "cssls",
        "ts_ls",
        "jsonls",
        "pyright",
        "clangd",
        "marksman",
        "jdtls",
      }
    end,
  },
}
