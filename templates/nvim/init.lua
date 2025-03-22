vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

require('rainbow-delimiters.setup').setup {
    strategy = {
        -- ...
    },
    query = {
        -- ...
    },
    highlight = {
        -- ...
        'RainbowDelimiterBlue',    -- Nivel 1
        'RainbowDelimiterGreen',   -- Nivel 2
        'RainbowDelimiterYellow',  -- Nivel 3
        'RainbowDelimiterOrange',  -- Nivel 4
        'RainbowDelimiterRed',     -- Nivel 5
        'RainbowDelimiterViolet',  -- Nivel 6
        'RainbowDelimiterCyan',    -- Nivel 7
    },
}

--limpiando bordes
-- Crear un grupo de autocomandos llamado 'python_executor'
vim.api.nvim_create_augroup("python_executor", { clear = true })

-- Autocomando para archivos Python
vim.api.nvim_create_autocmd("filetype", {
    pattern = "python",
    group = "python_executor",
    callback = function()
        -- Mapeo de tecla para ejecutar Python en una terminal en la parte inferior
        vim.api.nvim_buf_set_keymap(0, 'n', '<leader>r', ':belowright 15split<CR>:term python %<CR>:startinsert<CR>', { noremap = true, silent = true })
    end
})

-- Configuración opcional para estética (eliminar bordes)
vim.opt.fillchars = { horiz = " ", vert = " " }
vim.cmd [[
    highlight WinSeparator guibg=None guifg=None
]]

