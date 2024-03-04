local keymap = require("k92.utils.keymaps")
local map = keymap.map

return {
	"mbbill/undotree",
	event = { "BufReadPost", "BufNewFile", "BufWritePre" },
	opts = {},
	config = function()
		map(
			"n",
			"<leader>u",
			vim.cmd.UndotreeToggle,
			{ desc = "Toggle [U]ndotree" }
		)
	end,
}
