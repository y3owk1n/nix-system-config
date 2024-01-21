local keymap = require("k92.utils.keymaps")
local map = keymap.map

return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		settings = {
			save_on_toggle = true,
			sync_on_ui_close = true,
		},
	},
	config = function(_, opts)
		local harpoon = require("harpoon")
		harpoon:setup(opts)

		map("n", "<leader>he", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon Menu" })
		map("n", "<leader>ha", function()
			harpoon:list():append()
		end, { desc = "Mark file with harpoon" })
	end,
}
