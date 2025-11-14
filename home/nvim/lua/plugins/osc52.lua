return {
	"ojroques/nvim-osc52",
	config = function()
		require("osc52").setup({
			max_length = 0, -- 不限制长度
			silent = false,
			trim = false,
		})

		local function copy()
			if vim.v.event.operator == "y" and vim.v.event.regname == "" then
				require("osc52").copy_register("")
			end
		end

		vim.api.nvim_create_autocmd("TextYankPost", { callback = copy })
	end,
}
