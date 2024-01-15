local map = require("k92.utils.keymaps").map

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	cmd = "Neotree",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	deactivate = function()
		vim.cmd([[Neotree close]])
	end,
	config = function()
		-- If you want icons for diagnostic errors, you'll need to define them somewhere:
		vim.fn.sign_define(
			"DiagnosticSignError",
			{ text = " ", texthl = "DiagnosticSignError" }
		)
		vim.fn.sign_define(
			"DiagnosticSignWarn",
			{ text = " ", texthl = "DiagnosticSignWarn" }
		)
		vim.fn.sign_define(
			"DiagnosticSignInfo",
			{ text = " ", texthl = "DiagnosticSignInfo" }
		)
		vim.fn.sign_define(
			"DiagnosticSignHint",
			{ text = "󰌵", texthl = "DiagnosticSignHint" }
		)

		require("neo-tree").setup({
			sources = {
				"filesystem",
				"buffers",
				"git_status",
				"document_symbols",
			},
			open_files_do_not_replace_types = {
				"terminal",
				"Trouble",
				"trouble",
				"qf",
				"Outline",
			},
			filesystem = {
				bind_to_cwd = false,
				follow_current_file = { enabled = true },
				use_libuv_file_watcher = true,
			},
			window = {
				position = "current",
				mappings = {
					["<space>"] = "none",
				},
			},
			default_component_configs = {
				indent = {
					with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
			},

			map("n", "<leader>e", function()
				require("neo-tree.command").execute({
					toggle = true,
				})
			end, { desc = "Explorer NeoTree (root dir)" }),

			map("n", "<leader>ge", function()
				require("neo-tree.command").execute({
					toggle = true,
					source = "git_status",
				})
			end, { desc = "Git explorer" }),
		})
	end,
}
