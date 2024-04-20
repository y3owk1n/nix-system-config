local augroup = require("k92.utils.autocmds").augroup
local find_root = require("k92.utils.file").find_root

return {
	"mfussenegger/nvim-lint",
	lazy = true,
	event = { "BufReadPre", "BufNewFile", "InsertLeave" }, -- to disable, comment this out
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			-- lua = { "luacheck" },
			fish = { "fish" },
			javascript = { "biomejs", "eslint_d" },
			javascriptreact = { "biomejs", "eslint_d" },
			typescript = { "biomejs", "eslint_d" },
			typescriptreact = { "biomejs", "eslint_d" },
			json = { "biomejs", "eslint_d" },
			jsonc = { "biomejs", "eslint_d" },
			yaml = { "yamllint" },
			nix = { "nix" },
			markdown = { "markdownlint" },
		}

		vim.api.nvim_create_autocmd(
			{ "BufEnter", "BufWritePost", "InsertLeave" },
			{
				group = augroup("lint"),
				callback = function()
					local names = lint.linters_by_ft[vim.bo.filetype]
					local current_filename = vim.fn.expand("%:p")

					local js_related_fts = {
						javascript = true,
						javascriptreact = true,
						typescript = true,
						typescriptreact = true,
						json = true,
						jsonc = true,
					}

					if js_related_fts[vim.bo.filetype] then
						if
							find_root(
								{ filename = current_filename },
								{ ".eslintrc.js", ".eslintrc.cjs" }
							)
						then
							lint.try_lint("eslint_d")
						else
							for i, name in ipairs(names) do
								if name == "eslint_d" then
									table.remove(names, i)
									break -- Exit the loop once 'eslint_d' is removed
								end
							end
							lint.try_lint(names)
						end
					else
						lint.try_lint(names)
					end
				end,
			}
		)
	end,
}
