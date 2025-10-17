return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "storm",
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.defer_fn(function()
        vim.cmd([[colorscheme tokyonight]])
      end, 0)
    end,
  },
}
