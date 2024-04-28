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
		"nvim-telescope/telescope-file-browser.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local open_with_trouble = require("trouble.sources.telescope").open
		-- local fb_actions = require("telescope._extensions.file_browser.actions")

		-- Use this to add more results without clearing the trouble list
		local add_to_trouble = require("trouble.sources.telescope").add

		telescope.setup({
			defaults = {
				path_display = { "truncate " },
				wrap_results = true,
				layout_strategy = "horizontal",
				layout_config = { prompt_position = "top" },
				sorting_strategy = "ascending",
				winblend = 0,
				mappings = {
					i = {
						["<c-a>"] = open_with_trouble,
						["<c-A>"] = add_to_trouble,
						["<c-j>"] = actions.move_selection_next,
						["<c-k>"] = actions.move_selection_previous,
						["<C-y>"] = actions.select_horizontal,
						["<C-x>"] = actions.select_vertical,
					},
					n = {
						["<c-a>"] = open_with_trouble,
						["<c-A>"] = add_to_trouble,
						["q"] = actions.close,
						["-"] = actions.select_horizontal,
						["/"] = actions.select_vertical,
					},
				},
			},
			pickers = {
				diagnostics = {
					theme = "dropdown",
					initial_mode = "normal",
					layout_config = {
						preview_cutoff = 9999,
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("notify")
		telescope.load_extension("file_browser")
		-- set keymaps
		local builtin = require("telescope.builtin")
		local extensions = require("telescope").extensions
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
			{ desc = "[S]earch Resume" }
		)
		keymap.set("n", "<leader>sc", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch Neovim [C]onfig" })
		keymap.set("n", "<leader>sn", function()
			extensions.notify.notify()
		end, { desc = "[S]earch [N]notifications" })
		keymap.set("n", "<leader>e", function()
			local function telescope_buffer_dir()
				return vim.fn.expand("%:p:h")
			end

			telescope.extensions.file_browser.file_browser({
				path = "%:p:h",
				cwd = telescope_buffer_dir(),
				grouped = true,
				previewer = false,
				auto_depth = true,
				initial_mode = "normal",
				layout_config = { height = 40 },
			})
		end, { desc = "Open File Browser with the path of the current buffer" })
	end,
}
