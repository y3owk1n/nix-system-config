return {
	"nvimtools/none-ls.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
		"mason.nvim",
	},
	opts = function(_, opts)
		local nls = require("null-ls")

		opts.root_dir = opts.root_dir
			or require("null-ls.utils").root_pattern(
				".null-ls-root",
				".neoconf.json",
				"Makefile",
				".git"
			)

		local eslint_configs_files = {
			".eslintrc.js",
			".eslintrc.cjs",
			".eslintrc.yaml",
			".eslintrc.yml",
			".eslintrc.json",
			"eslint.config.js",
			"eslint.config.mjs",
			"eslint.config.cjs",
		}

		opts.sources = vim.list_extend(opts.sources or {}, {
			require("none-ls.code_actions.eslint_d").with({
				condition = function(utils)
					return utils.root_has_file(eslint_configs_files)
				end,
			}),
			require("none-ls.diagnostics.eslint_d").with({
				condition = function(utils)
					return utils.root_has_file(eslint_configs_files)
				end,
			}),
			require("none-ls.diagnostics.yamllint"),
			nls.builtins.diagnostics.fish,
			nls.builtins.diagnostics.markdownlint,
		})
	end,
}
