return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "auto",
        icons_enabled = true,
        section_separators = { left = "", right = "" },
        -- component_separators = { left = "│", right = "│" },
        -- component_separators = { left = " ", right = "│" },
        component_separators = { left = "·", right = "›" },
        globalstatus = true,
        always_divide_middle = false,
      },

      sections = {
        lualine_a = {
          { "mode", icon = "" },
        },
        lualine_b = {
          {
            "filename",
            path = 1,
            symbols = {
              modified = " ●",
              readonly = " ",
              unnamed = "[Sin nombre]",
            },
          },
        },
        lualine_c = {
          {
            function()
              local head = vim.b.gitsigns_head
              if not head or head == "" then
                head = vim.fn.FugitiveHead and vim.fn.FugitiveHead() or ""
              end
              return head ~= "" and " " .. head or " sin rama"
            end,
            color = { fg = "#FAB387" },
          },
          {
            "diff",
            colored = true,
            symbols = {
              added = " ",
              modified = " ",
              removed = " ",
            },
          },
        },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_lsp" },
            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = "󰌵 ",
            },
          },
          "encoding",
          "fileformat",
          "filetype",
        },
        lualine_y = {
          {
            function()
              local cur = vim.fn.line(".")
              local total = vim.fn.line("$")
              local percent = math.floor(cur / total * 100)
              local utils = require("lualine.utils.utils")
              return utils.stl_escape(string.format("%d%% (%d/%d)", percent, cur, total))
            end,
          },
        },

        lualine_z = {
          { "location", icon = "" },
        },
      },

      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          { "filename", path = 0 },
        },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    },
  },
}
