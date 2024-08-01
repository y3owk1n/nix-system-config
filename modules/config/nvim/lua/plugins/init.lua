return {
	-- {
	-- 	"christoomey/vim-tmux-navigator",
	-- 	cmd = {
	-- 		"TmuxNavigateLeft",
	-- 		"TmuxNavigateDown",
	-- 		"TmuxNavigateUp",
	-- 		"TmuxNavigateRight",
	-- 		"TmuxNavigatePrevious",
	-- 	},
	-- 	keys = {
	-- 		{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
	-- 		{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
	-- 		{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
	-- 		{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
	-- 		{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
	-- 	},
	-- },
	{
		"GR3YH4TT3R93/zellij-nav.nvim",
		init = function() -- Only needed if you want to override default keymaps otherwise just call opts = {}
			vim.g.zellij_nav_default_mappings = false -- Default: true
		end,
		opts = {},
		keys = {
			{ "<c-h>", "<cmd>:ZellijNavigateLeft<cr>" },
			{ "<c-j>", "<cmd>:ZellijNavigateDown<cr>" },
			{ "<c-k>", "<cmd>:ZellijNavigateUp<cr>" },
			{ "<c-l>", "<cmd>:ZellijNavigateRight<cr>" },
		},
	},
	{
		"dmmulroy/ts-error-translator.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
	{
		"folke/todo-comments.nvim",
		lazy = true,
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{
		"y3owk1n/tailwind-autosort.nvim",
		-- dir = "~/Dev/tailwind-autosort.nvim", -- Your path
		lazy = true,
		event = { "LspAttach" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {},
	},
	{
		"prochri/telescope-all-recent.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"kkharji/sqlite.lua",
			-- optional, if using telescope for vim.ui.select
			"stevearc/dressing.nvim",
		},
		-- can reset the database by deleting ~/.local/share/nvim/telescope-all-recent.sqlite3
		opts = {
			-- your config goes here
			default = {
				sorting = "frecency", -- sorting: options: 'recent' and 'frecency'
			},
		},
	},
}
