return {
  "OXY2DEV/markview.nvim",
  name = "markview.nvim",
  lazy = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("markview").setup({
      markdown = { enable = true },
      latex = {
        enable = true,
        inline = { enable = true },
        block = { enable = true },
      },
    })
  end,
}
