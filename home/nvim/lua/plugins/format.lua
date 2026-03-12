return {
	{
		"stevearc/conform.nvim",
		opts = function(_, opts)
			opts.formatters = opts.formatters or {}
			opts.formatters_by_ft = opts.formatters_by_ft or {}
			-- Nix
			opts.formatters_by_ft.nix = { "alejandra" }
			-- Go
			opts.formatters_by_ft.go = { "gofumpt" }
			-- Lua
			opts.formatters_by_ft.lua = { "stylua" }
			-- Java
			opts.formatters.google_java_format = {
				command = "google-java-format",
				args = { "-" },
				stdin = true,
			}
			opts.formatters_by_ft.java = { "google_java_format" }
			-- Rust
			opts.formatters_by_ft.rust = { "rustfmt" }
			-- Shell
			opts.formatters_by_ft.sh = { "shfmt" }
			-- C/C++
			opts.formatters_by_ft.c = { "clang_format" }
			opts.formatters_by_ft.cpp = { "clang_format" }
			-- Kotlin
			opts.formatters_by_ft.kotlin = { "ktlint" }
			-- Python
			opts.formatters_by_ft.python = { "ruff_format" }
			-- JS/TS/Web
			opts.formatters_by_ft.javascript = { "biome" }
			opts.formatters_by_ft.typescript = { "biome" }
			opts.formatters_by_ft.javascriptreact = { "biome" }
			opts.formatters_by_ft.typescriptreact = { "biome" }
			opts.formatters_by_ft.vue = { "biome" }
			-- JSON
			opts.formatters_by_ft.json = { "biome" }
			-- YAML
			opts.formatters_by_ft.yaml = { "yamlfmt" }
			-- TOML
			opts.formatters_by_ft.toml = { "taplo" }
			-- Dart
			opts.formatters_by_ft.dart = {
				command = "dart",
				args = function(ctx)
					return { "format", ctx.bufname }
				end,
				stdin = false,
				exit_codes = { 0 },
			}
			opts.formatters_by_ft.fish = nil
			opts.notify_on_error = true
			opts.notify_no_formatters = true
			return opts
		end,
	},
}
