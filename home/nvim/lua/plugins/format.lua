return {
	{
		"stevearc/conform.nvim",
		opts = function(_, opts)
			opts.format_on_save = nil
			opts.formatters = opts.formatters or {}
			opts.formatters.nixpkgs_fmt = {
				command = "nixpkgs-fmt",
				args = function(ctx)
					return {}
				end,
				stdin = true,
				exit_codes = { 0 },
			}
			opts.formatters_by_ft = opts.formatters_by_ft or {}
			opts.formatters_by_ft.nix = { "nixpkgs_fmt", stop_after_first = true }
			opts.formatters_by_ft.lua = { "stylua" }
			opts.formatters_by_ft.python = { "black", "ruff_format" }
			opts.formatters_by_ft.sh = { "shfmt" }
			opts.formatters_by_ft.javascript = { "prettier" }
			opts.formatters_by_ft.typescript = { "prettier" }
			opts.formatters_by_ft.javascriptreact = { "prettier" }
			opts.formatters_by_ft.typescriptreact = { "prettier" }
			opts.formatters_by_ft.vue = { "prettier" }
			opts.formatters_by_ft.go = { "gofmt" }
			opts.formatters_by_ft.c = { "clang_format" }
			opts.formatters_by_ft.cpp = { "clang_format" }
			opts.formatters_by_ft.rust = { "rustfmt" }
			opts.formatters_by_ft.java = { "google-java-format" }
			opts.formatters_by_ft.json = { "jq" }
			opts.formatters_by_ft.yaml = { "yamlfmt" }
			opts.formatters_by_ft.toml = { "taplo" }
			opts.default_format_opts = {
				timeout_ms = 1000,
				lsp_format = "fallback",
				stop_after_first = false,
			}
			opts.log_level = vim.log.levels.ERROR
			opts.notify_on_error = true
			opts.notify_no_formatters = true
			return opts
		end,
	},
}
