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
		opts = {
			view_options = {
				show_hidden = true,
			},
			lsp_file_methods = {
				-- Time to wait for LSP file operations to complete before skipping
				timeout_ms = 1000,
				-- Set to true to autosave buffers that are updated with LSP willRenameFiles
				-- Set to "unmodified" to only save unmodified buffers
				autosave_changes = false,
			},
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
			experimental_watch_for_changes = true,
		},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function(opts)
			local oil = require("oil")
			oil.setup(opts)

			map("n", "<leader>e", function()
				oil.toggle_float()
			end, { desc = "Explorer" })

			map("n", "<leader>E", function()
				oil.toggle_float(vim.fn.getcwd())
			end, { desc = "Explorer (CWD)" })
		end,
	},
}
