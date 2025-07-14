return {
  {
    "hiphish/rainbow-delimiters.nvim",
    config = function()
      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = require("rainbow-delimiters.strategy.global"),
          lua = require("rainbow-delimiters.strategy.local"),
          javascript = require("rainbow-delimiters.strategy.local"),
          python = require("rainbow-delimiters.strategy.global"),
        },
        highlight = {
          "RainbowDelimiterGold", -- foreground1
          "RainbowDelimiterViolet", -- foreground2
          "RainbowDelimiterSky", -- foreground3
          "RainbowDelimiterAlt1",
          "RainbowDelimiterAlt2",
          "RainbowDelimiterAlt3",
          "RainbowDelimiterAlt4",
        },
      }

      -- VSCode GitHub Dark theme
      local colors = {
        Gold = "#FFD700", -- bright gold
        Violet = "#DA70D6", -- orchid purple
        Sky = "#179fff", -- deep sky blue
        Alt1 = "#ffd900", -- guide background 1
        Alt2 = "#CC66CC", -- guide background 2
        Alt3 = "#87CEFA", -- light sky blue
        Alt4 = "#ff5370", -- fallback highlight
      }

      local set = vim.cmd
      local groups = {
        { name = "RainbowDelimiterGold", color = colors.Gold },
        { name = "RainbowDelimiterViolet", color = colors.Violet },
        { name = "RainbowDelimiterSky", color = colors.Sky },
        { name = "RainbowDelimiterAlt1", color = colors.Alt1 },
        { name = "RainbowDelimiterAlt2", color = colors.Alt2 },
        { name = "RainbowDelimiterAlt3", color = colors.Alt3 },
        { name = "RainbowDelimiterAlt4", color = colors.Alt4 },
      }

      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          for _, group in ipairs(groups) do
            set("highlight " .. group.name .. " guifg=" .. group.color)
          end
        end,
      })

      vim.schedule(function()
        for _, group in ipairs(groups) do
          set("highlight " .. group.name .. " guifg=" .. group.color)
        end
      end)
    end,
  },
}
