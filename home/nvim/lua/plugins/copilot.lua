return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = true, auto_trigger = true },
			})
		end,
	},

	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim" },
		},
		opts = {
			debug = false,
		},
		keys = {
			{ "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
			{ "<leader>ce", "<cmd>CopilotChatExplain<cr>", mode = "v", desc = "CopilotChat - Explain code" },
		},
	},
}
