local map = require("k92.utils.keymaps").map

vim.api.nvim_create_autocmd("FileType", {
	pattern = "oil",
	callback = function()
		vim.opt_local.colorcolumn = ""
	end,
})

return {
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local oil = require("oil")
			oil.setup({
				view_options = {
					show_hidden = true,
				},
				lsp_rename_autosave = true,
				delete_to_trash = true,
				skip_confirm_for_simple_edits = true,
				keymaps = {
					["?"] = "actions.show_help",
					["<CR>"] = "actions.select",
					["<leader>o\\"] = "actions.select_vsplit",
					["<leader>o-"] = "actions.select_split", -- this is used to navigate left
					["<leader>or"] = "actions.refresh",
					["<leader>os"] = "actions.change_sort",
					["<leader>ox"] = "actions.open_external",
					["<leader>oh"] = "actions.toggle_hidden",
					["<leader>ot"] = "actions.toggle_trash",
					["-"] = "actions.parent",
					["_"] = "actions.open_cwd",
				},
				use_default_keymaps = false,
			})

			map("n", "<leader>e", function()
				oil.toggle_float()
			end, { desc = "Explorer" })

			map("n", "<leader>E", function()
				oil.toggle_float(vim.fn.getcwd())
			end, { desc = "Explorer Parent" })
		end,
	},
}
