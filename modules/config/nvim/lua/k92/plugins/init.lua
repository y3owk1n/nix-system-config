return {
	{ "christoomey/vim-tmux-navigator" },
	{
		"b0o/SchemaStore.nvim",
		lazy = true,
		version = false, -- last release is way too old
	},
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		opts = {},
	},
	{
		"kylechui/nvim-surround",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = true,
	},
	{
		"NvChad/nvim-colorizer.lua",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},
	{
		"dmmulroy/ts-error-translator.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		main = "ibl",
		opts = {},
	},
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
}
