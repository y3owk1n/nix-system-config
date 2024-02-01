local keymap = require("k92.utils.keymaps")
local map = keymap.map

return {
	"lewis6991/gitsigns.nvim",
	lazy = true,
	event = { "BufReadPost", "BufNewFile", "BufWritePre" },
	config = function(_, opts)
		local gitsigns = require("gitsigns")

		gitsigns.setup(opts)

		map(
			"n",
			"<leader>gp",
			":Gitsigns preview_hunk<cr>",
			{ desc = "Preview hunk" }
		)
	end,
}
