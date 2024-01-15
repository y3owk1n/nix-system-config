local keymap = require("k92.utils.keymaps")
local map = keymap.map

return {
	"Exafunction/codeium.vim",
	lazy = true,
	event = { "InsertEnter" },
	cmd = "Codeium",
	build = ":Codeium Auth",
	opts = {},
	config = function()
		map("i", "<Right>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true, silent = true, desc = "Codeium Accept" })

		map("i", "<C-n>", function()
			return vim.fn["codeium#CycleCompletions"](1)
		end, { expr = true, silent = true, desc = "Codeium Cycle Completions" })
	end,
}
