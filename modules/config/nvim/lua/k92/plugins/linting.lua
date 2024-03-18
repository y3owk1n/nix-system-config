local augroup = require("k92.utils.autocmds").augroup
local find_root = require("k92.utils.file").find_root

return {
	"mfussenegger/nvim-lint",
	lazy = true,
	event = { "BufReadPre", "BufNewFile", "InsertLeave" }, -- to disable, comment this out
	config = function()
		local lint = require("lint")
		local biomejs = lint.linters.biomejs

		biomejs.condition = function(ctx)
			return find_root(ctx, { "biome.json" })
		end

		lint.linters_by_ft = {
			lua = { "luacheck" },
			fish = { "fish" },
			javascript = { "biomejs", "eslint" },
			javascriptreact = { "biomejs", "eslint" },
			typescript = { "biomejs", "eslint" },
			typescriptreact = { "biomejs", "eslint" },
			json = { "biomejs", "eslint" },
			jsonc = { "biomejs", "eslint" },
			yaml = { "yamllint" },
			nix = { "nix" },
			markdown = { "markdownlint" },
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
