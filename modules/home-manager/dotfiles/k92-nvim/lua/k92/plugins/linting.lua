local augroup = require("k92.utils.autocmds").augroup

return {
	"mfussenegger/nvim-lint",
	lazy = true,
	event = { "BufReadPre", "BufNewFile", "InsertLeave" }, -- to disable, comment this out
	config = function()
		local lint = require("lint")

		lint.linters = {
			biomejs = {
				condition = function(ctx)
					return vim.fs.find(
						{ "biome.json" },
						{ path = ctx.filename, upward = true }
					)[1]
				end,
			},
		}

		lint.linters_by_ft = {
			sh = { "shellcheck" },
			-- lua = { "luacheck" },
			fish = { "fish" },
			javascript = { "biomejs" },
			javascriptreact = { "biomejs" },
			typescript = { "biomejs" },
			typescriptreact = { "biomejs" },
			json = { "biomejs" },
			jsonc = { "biomejs" },
			yaml = { "yamllint" },
			-- nix = { "nix" },
			-- markdown = { "markdownlint" },
		}

		vim.api.nvim_create_autocmd(
			{ "BufEnter", "BufWritePost", "InsertLeave" },
			{
				group = augroup("lint"),
				callback = function()
					lint.try_lint()
				end,
			}
		)
	end,
}
