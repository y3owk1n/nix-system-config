return {
	"mfussenegger/nvim-lint",
	opts = {
		linters = {
			biomejs = {
				-- `condition` is another LazyVim extension that allows you to
				-- dynamically enable/disable linters based on the context.
				condition = function(ctx)
					return vim.fs.find(
						{ "biome.json" },
						{ path = ctx.filename, upward = true }
					)[1]
				end,
			},
		},
		-- Event to trigger linters
		linters_by_ft = {
			sh = { "shellcheck" },
			lua = { "luacheck" },
			fish = { "fish" },
			javascript = { "biomejs" },
			javascriptreact = { "biomejs" },
			typescript = { "biomejs" },
			typescriptreact = { "biomejs" },
			json = { "biomejs" },
			jsonc = { "biomejs" },
			yaml = { "yamllint" },
			nix = { "nix" },
			markdown = { "markdownlint" },
		},
	},
}
