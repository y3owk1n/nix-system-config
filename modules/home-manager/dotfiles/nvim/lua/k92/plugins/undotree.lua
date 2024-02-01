local keymap = require("k92.utils.keymaps")
local map = keymap.map

return {
	"mbbill/undotree",

	config = function()
		map(
			"n",
			"<leader>u",
			vim.cmd.UndotreeToggle,
			{ desc = "Toggle undotree" }
		)
	end,
}
