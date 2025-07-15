-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- -- -- Execute in lower terminal--
vim.keymap.set("n", "<leader>rr", "<cmd>RunCode<CR>", {
  noremap = true,
  silent = true,
  desc = "Execute in lower terminal",
})
-- Execute in floating terminal --
vim.keymap.set("n", "<leader>rf", function()
  local file = vim.fn.expand("%:p")
  local ft = vim.bo.filetype

  local cmds = {
    python = "python3 " .. file,
    cpp = "g++ " .. file .. " -o out && ./out",
    javascript = "node " .. file,
    java = "javac " .. file .. " && java " .. vim.fn.expand("%:t:r"),
  }

  local cmd = cmds[ft]
  if cmd then
    local Terminal = require("toggleterm.terminal").Terminal
    -- local shell = vim.fn.has("win32") == 1 and "cmd /K" or "zsh"
    -- local shell = os.getenv("SHELL") or "bash"

    local term = Terminal:new({
      cmd = shell,
      direction = "float",
      close_on_exit = false,
      start_in_insert = false,
      float_opts = {
        border = "curved",
      },
    })

    term:toggle()
    vim.defer_fn(function()
      term:send(cmd)
    end, 200)
  else
    print("Unsupported language for execution in floating terminal: " .. ft)
  end
end, {
  desc = "Execute in floating terminal",
})

-- Close terminal <Esc>  --
vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>:ToggleTerm<CR>]], {
  noremap = true,
  silent = true,
  desc = "Close floating terminal with Esc",
})
