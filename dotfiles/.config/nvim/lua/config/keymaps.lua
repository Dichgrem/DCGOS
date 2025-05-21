-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Ctrl + Tab 切换到下一个 buffer
vim.keymap.set("n", "<C-Tab>", "<cmd>bnext<CR>", { desc = "Next buffer (like VSCode)" })

-- Ctrl + Shift + Tab 切换到上一个 buffer
vim.keymap.set("n", "<C-S-Tab>", "<cmd>bprevious<CR>", { desc = "Previous buffer (like VSCode)" })
