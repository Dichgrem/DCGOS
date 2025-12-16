-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Disable autoformat
vim.g.autoformat = false
-- Let terminal just one
vim.g.root_spec = { "cwd" }
-- Disable markdown views
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.conceallevel = 0
    vim.opt_local.concealcursor = ""
  end,
})
