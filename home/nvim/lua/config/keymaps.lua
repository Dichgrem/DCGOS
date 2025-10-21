-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- === VSCode-like buffer/tab navigation ===
map("n", "<C-Tab>", "<cmd>bnext<CR>", { desc = "Next buffer (like VSCode)" })
map("n", "<C-S-Tab>", "<cmd>bprevious<CR>", { desc = "Previous buffer (like VSCode)" })

-- === Close buffer like Ctrl + W in VSCode ===
vim.keymap.set("n", "<C-w>", "<cmd>BufferLinePickClose<CR>", { desc = "Close buffer (BufferLine)" })

vim.keymap.set("n", "<C-S-5>", function()
	if vim.bo.buftype == "terminal" then
		vim.cmd("vsplit | terminal")
	else
		vim.cmd("botright split | terminal")
	end
end, { desc = "Split terminal" })

-- 在终端模式下的快捷键
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Go to left window" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Go to lower window" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Go to upper window" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Go to right window" })

vim.keymap.set("n", "<leader>xo", function()
	vim.fn.jobstart({ "xdg-open", vim.fn.expand("%:p") }, { detach = true })
end, { desc = "使用系统默认应用程序打开当前文件" })
