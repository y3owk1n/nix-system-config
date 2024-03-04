return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")

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
		local builtin = require("telescope.builtin")
		local keymap = vim.keymap -- for conciseness

		keymap.set(
			"n",
			"<leader><space>",
			builtin.find_files,
			{ desc = "[S]earch [F]iles" }
		)
		keymap.set(
			"n",
			"<leader>sf",
			builtin.find_files,
			{ desc = "[S]earch [F]iles" }
		)
		keymap.set(
			"n",
			"<leader>s.",
			builtin.oldfiles,
			{ desc = "[S]earch Recent Files" }
		)
		keymap.set(
			"n",
			"<leader>sd",
			builtin.diagnostics,
			{ desc = "[S]earch [D]iagnostics" }
		)
		keymap.set(
			"n",
			"<leader>sg",
			builtin.live_grep,
			{ desc = "[S]earch by [G]rep" }
		)
		keymap.set(
			"n",
			"<leader>sw",
			builtin.grep_string,
			{ desc = "[S]earch current [W]ord" }
		)
		keymap.set(
			"n",
			"<leader>sb",
			"<cmd>Telescope current_buffer_fuzzy_find<cr>",
			{ desc = "[S]earch current [B]buffer Fuzzy" }
		)
		keymap.set(
			"n",
			"<leader>sh",
			builtin.help_tags,
			{ desc = "[S]earch [H]elp" }
		)
		keymap.set(
			"n",
			"<leader>sk",
			builtin.keymaps,
			{ desc = "[S]earch [K]eymaps" }
		)
		keymap.set(
			"n",
			"<leader>ss",
			builtin.builtin,
			{ desc = "[S]earch [S]elect Telescope" }
		)
		keymap.set(
			"n",
			"<leader>sx",
			builtin.resume,
			{ desc = "[S]earch [R]esume" }
		)
		keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })
	end,
}
