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

-- === Switch to buffer by number: Ctrl + 1~9 ===
for i = 1, 9 do
    map("n", "<C-" .. i .. ">", function()
    vim.cmd(i .. "b")
    end, { desc = "Go to buffer " .. i })
    end

    -- === Fuzzy find files (like Ctrl + P in VSCode) ===
    map("n", "<C-p>", "<cmd>Telescope find_files<CR>", { desc = "Find files (like VSCode Ctrl+P)" })

    -- === Fuzzy find buffers (like Ctrl + B in VSCode) ===
    map("n", "<C-b>", "<cmd>Telescope buffers<CR>", { desc = "Find open buffers (like VSCode Ctrl+B)" })

    -- === File Explorer (like Ctrl + Shift + E in VSCode) ===
    map("n", "<C-S-e>", "<cmd>Neotree toggle<CR>", { desc = "Toggle File Explorer (like VSCode)" })

