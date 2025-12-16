-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- === VSCode-like buffer/tab navigation   ===
map("n", "<C-Tab>", "<cmd>bnext<CR>", { desc = "Next buffer (like VSCode)" })
map("n", "<C-S-Tab>", "<cmd>bprevious<CR>", { desc = "Previous buffer (like VSCode)" })

-- === Vscode-like Close buffer navigation ===
vim.keymap.set("n", "<C-w>", function()
  local current = vim.api.nvim_get_current_buf()
  local buffers = vim.fn.getbufinfo({buflisted = 1})

  local next_buf = nil
  for i, buf in ipairs(buffers) do
    if buf.bufnr == current then
      next_buf = buffers[i + 1] or buffers[i - 1]
      break
    end
  end

  if next_buf then
    vim.api.nvim_set_current_buf(next_buf.bufnr)
  end

  vim.api.nvim_buf_delete(current, { force = true })
end, { desc = "Close current buffer like VSCode" })

-- XDG Open
vim.keymap.set("n", "<leader>xo", function()
	vim.fn.jobstart({ "xdg-open", vim.fn.expand("%:p") }, { detach = true })
end, { desc = "使用系统默认应用程序打开当前文件" })
