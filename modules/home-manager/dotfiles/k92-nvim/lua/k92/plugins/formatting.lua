return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	opts = {
		format_on_save = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 1000,
		},
		formatters = {
			biome = {
				condition = function(self, ctx)
					return vim.fs.find(
						{ "biome.json" },
						{ path = ctx.filename, upward = true }
					)[1]
				end,
			},
		},
		formatters_by_ft = {
			lua = { "stylua" },
			sh = { "beautysh" },
			fish = { "fish_indent" },
			javascript = { { "biome", "prettierd" } },
			javascriptreact = { { "biome", "prettierd" } },
			typescript = { { "biome", "prettierd" } },
			typescriptreact = { { "biome", "prettierd" } },
			json = { { "biome", "prettierd" } },
			jsonc = { { "biome", "prettierd" } },
			markdown = { "markdownlint" },
			["markdown.mdx"] = { "markdownlint" },
			nix = { "nixfmt" },
			["*"] = { "codespell" },
			["_"] = { "trim_whitespace" },
		},
	},
	config = function(_, opts)
		local conform = require("conform")

		conform.setup(opts)
	end,
}
