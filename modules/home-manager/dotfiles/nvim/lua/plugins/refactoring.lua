return {
	"ThePrimeagen/refactoring.nvim",
	keys = {
		{
			"<leader>r",
			function(opts)
				require("refactoring").select_refactor(opts)
			end,
			mode = "v",
			noremap = true,
			silent = true,
			expr = false,
			desc = "Refactor",
		},
	},
	opts = {},
}
