return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	cmd = {
		"ObsidianOpen",
		"ObsidianNew",
		"ObsidianBackLinks",
		"ObsidianYesterday",
		"ObsidianPasteImg",
	},
	event = {
		"BufReadPre "
			.. vim.fn.expand("~")
			.. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/**.md",
		"BufNewFile "
			.. vim.fn.expand("~")
			.. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/**.md",
	},
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"hrsh7th/nvim-cmp",
		-- see below for full list of optional dependencies 👇
	},
	keys = {
		{
			"<localleader>o",
			"<cmd>ObsidianOpen<CR>",
			desc = "Open in Obsidian",
		},
		{ "<localleader>n", "<cmd>ObsidianNew<CR>", desc = "New note" },
		{
			"<localleader>b",
			"<cmd>ObsidianBacklinks<CR>",
			desc = "Backlinks list",
		},
		{ "<localleader>t", "<cmd>ObsidianToday<CR>", desc = "Today Note" },
		{
			"<localleader>y",
			"<cmd>ObsidianYesterday<CR>",
			desc = "Yesterday Note",
		},
		{
			"<localleader>c",
			"<cmd>lua require('obsidian').util.toggle_checkbox()<cr>",
			desc = "Toggle Checkbox",
		},
		{ "<localleader>i", "<cmd>ObsidianPasteImg<cr>", desc = "Paste Image" },
	},
	opts = {
		workspaces = {
			{
				name = "kyle",
				path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Kyle/",
			},
			{
				name = "traworld",
				path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Traworld/",
			},
		},

		-- Optional, set to true to use the current directory as a vault; otherwise,
		-- the first workspace is opened by default
		detect_cwd = true,

		-- see below for full list of options 👇
		daily_notes = {
			-- Optional, if you keep daily notes in a separate directory.
			folder = "02 - daily",
		},

		-- Optional, completion.
		completion = {
			-- If using nvim-cmp, otherwise set to false
			nvim_cmp = true,
			-- Trigger completion at 2 chars
			min_chars = 2,
			-- Where to put new notes created from completion. Valid options are
			--  * "current_dir" - put new notes in same directory as the current buffer.
			--  * "notes_subdir" - put new notes in the default notes subdirectory.
			new_notes_location = "current_dir",

			-- Whether to add the output of the node_id_func to new notes in autocompletion.
			-- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
			prepend_note_id = true,
		},

		-- Optional, key mappings.
		mappings = {
			-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
			["gd"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
		},

		-- Optional, customize the backlinks interface.
		backlinks = {
			-- The default height of the backlinks pane.
			height = 10,
			-- Whether or not to wrap lines.
			wrap = true,
		},

		-- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
		-- URL it will be ignored but you can customize this behavior here.
		follow_url_func = function(url)
			-- Open the URL in the default web browser.
			vim.fn.jobstart({ "open", url }) -- Mac OS
			-- vim.fn.jobstart({"xdg-open", url})  -- linux
		end,

		-- Optional, by default commands like `:ObsidianSearch` will attempt to use
		-- telescope.nvim, fzf-lua, or fzf.vim (in that order), and use the
		-- first one they find. You can set this option to tell obsidian.nvim to always use this
		-- finder.
		finder = "telescope.nvim",

		-- Optional, sort search results by "path", "modified", "accessed", or "created".
		-- The recommend value is "modified" and `true` for `sort_reversed`, which means, for example `:ObsidianQuickSwitch`
		-- will show the notes sorted by latest modified time
		sort_by = "modified",
		sort_reversed = true,

		-- Optional, configure additional syntax highlighting / extmarks.
		ui = {
			enable = true, -- set to false to disable all additional syntax features
			update_debounce = 200, -- update rate in milliseconds
			checkboxes = {
				-- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
				[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
				["x"] = { char = "", hl_group = "ObsidianDone" },
				[">"] = { char = "", hl_group = "ObsidianRightArrow" },
				["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
				-- Replace the above with this if you don't have a patched font:
				-- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
				-- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

				-- You can also add more custom ones...
			},
			external_link_icon = {
				char = "",
				hl_group = "ObsidianExtLinkIcon",
			},
			-- Replace the above with this if you don't have a patched font:
			-- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
			reference_text = { hl_group = "ObsidianRefText" },
			highlight_text = { hl_group = "ObsidianHighlightText" },
			tags = { hl_group = "ObsidianTag" },
			hl_groups = {
				-- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
				ObsidianTodo = { bold = true, fg = "#f78c6c" },
				ObsidianDone = { bold = true, fg = "#89ddff" },
				ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
				ObsidianTilde = { bold = true, fg = "#ff5370" },
				ObsidianRefText = { underline = true, fg = "#c792ea" },
				ObsidianExtLinkIcon = { fg = "#c792ea" },
				ObsidianTag = { italic = true, fg = "#89ddff" },
				ObsidianHighlightText = { bg = "#75662e" },
			},
		},

		attachments = {
			-- The default folder to place images in via `:ObsidianPasteImg`.
			-- If this a relative path it will be interpreted as relative to the vault root.
			-- You can always override this per image by passing a full path to the command instead of just a filename.
			img_folder = "98 - attachments", -- This is the default
			-- A function that determines the text to insert in the note when pasting an image.
			-- It takes two arguments, the `obsidian.Client` and a plenary `Path` to the image file.
			-- The is the default implementation.
			---@param client obsidian.Client
			---@param path Path the absolute path to the image file
			---@return string
			img_text_func = function(client, path)
				local link_path
				local vault_relative_path = client:vault_relative_path(path)
				if vault_relative_path ~= nil then
					-- Use relative path if the image is saved in the vault dir.
					link_path = vault_relative_path
				else
					-- Otherwise use the absolute path.
					link_path = tostring(path)
				end
				local display_name = vim.fs.basename(link_path)
				return string.format("![[%s]]", link_path)
			end,
		},
	},
}
