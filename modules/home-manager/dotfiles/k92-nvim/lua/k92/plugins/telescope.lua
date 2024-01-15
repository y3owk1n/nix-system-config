return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function(_, opts)
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "truncate " },
				wrap_results = true,
				layout_strategy = "horizontal",
				layout_config = { prompt_position = "top" },
				sorting_strategy = "ascending",
				winblend = 0,
				mappings = {
					n = {},
				},
			},
			pickers = {
				diagnostics = {
					theme = "ivy",
					initial_mode = "normal",
					layout_config = {
						preview_cutoff = 9999,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set(
			"n",
			"<leader>ff",
			"<cmd>Telescope find_files<cr>",
			{ desc = "Fuzzy find files in cwd" }
		)
		keymap.set(
			"n",
			"<leader>fr",
			"<cmd>Telescope oldfiles<cr>",
			{ desc = "Fuzzy find recent files" }
		)

		keymap.set(
			"n",
			"<leader>sg",
			"<cmd>Telescope live_grep<cr>",
			{ desc = "Find string in cwd" }
		)
		keymap.set(
			"n",
			"<leader>sb",
			"<cmd>Telescope current_buffer_fuzzy_find<cr>",
			{ desc = "Fuzzy find in current buffer" }
		)
		keymap.set(
			"n",
			"<leader>sh",
			"<cmd>Telescope help_tags<cr>",
			{ desc = "Fuzzy find help" }
		)
		keymap.set(
			"n",
			"<leader>sa",
			"<cmd>Telescope autocommands<cr>",
			{ desc = "Fuzzy find autocommands" }
		)
		keymap.set(
			"n",
			"<leader>sk",
			"<cmd>Telescope keymaps<cr>",
			{ desc = "Fuzzy find keymaps" }
		)
		keymap.set(
			"n",
			"<leader>sm",
			"<cmd>Telescope man_pages<cr>",
			{ desc = "Fuzzy find man pages" }
		)
		keymap.set(
			"n",
			"<leader>sx",
			"<cmd>Telescope resume<cr>",
			{ desc = "Fuzzy find last" }
		)

		keymap.set(
			"n",
			"<leader>gc",
			"<cmd>Telescope git_commits<cr>",
			{ desc = "Fuzzy find git commits" }
		)
		keymap.set(
			"n",
			"<leader>gs",
			"<cmd>Telescope git_status<cr>",
			{ desc = "Fuzzy find git status" }
		)
	end,
}
