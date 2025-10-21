return {
	"sindrets/diffview.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
	config = function()
		require("diffview").setup()
	end,
}
