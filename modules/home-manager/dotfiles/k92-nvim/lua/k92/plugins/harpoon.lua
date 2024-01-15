return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function(_, opts)
		local harpoon = require("harpoon")
		harpoon:setup(opts)

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>he", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon Menu" })
		keymap.set("n", "<leader>ha", function()
			harpoon:list():append()
		end, { desc = "Mark file with harpoon" })
	end,
}
