return {
	{
		"stevearc/conform.nvim",
		opts = function(_, opts)
			opts.format_on_save = nil
			opts.formatters = opts.formatters or {}
			opts.formatters_by_ft = opts.formatters_by_ft or {}
			opts.formatters.nixpkgs_fmt = {
				command = "nixpkgs-fmt",
				args = function(ctx)
					return {}
				end,
				stdin = true,
				exit_codes = { 0 },
			}

			-- Go
			opts.formatters_by_ft.go = { "gofumpt" }
			-- Lua
			opts.formatters_by_ft.lua = { "stylua" }
			-- Nix
			opts.formatters_by_ft.nix = { "nixpkgs_fmt", stop_after_first = true }
			-- Java
			opts.formatters_by_ft.java = { "google_java_format" }
			-- Rust
			opts.formatters_by_ft.rust = { "rustfmt" }
			-- Shell
			opts.formatters_by_ft.sh = { "shfmt" }
			-- C/C++
			opts.formatters_by_ft.c = { "clang_format" }
			opts.formatters_by_ft.cpp = { "clang_format" }
			-- Python
			opts.formatters_by_ft.python = { "black", "ruff_format" }
			-- JS/TS/Web
			opts.formatters_by_ft.javascript = { "prettierd" }
			opts.formatters_by_ft.typescript = { "prettierd" }
			opts.formatters_by_ft.javascriptreact = { "prettierd" }
			opts.formatters_by_ft.typescriptreact = { "prettierd" }
			opts.formatters_by_ft.vue = { "prettierd" }
			-- JSON
			opts.formatters_by_ft.json = { "jq" }
			-- YAML
			opts.formatters_by_ft.yaml = { "yamlfmt" }
			-- TOML
			opts.formatters_by_ft.toml = { "taplo" }
			opts.default_format_opts = {
				timeout_ms = 1500,
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
