return {
	"Exafunction/codeium.vim",
	event = "BufEnter",
	cmd = "Codeium",
	build = ":Codeium Auth",
	opts = {},
	config = function()
		vim.keymap.set("i", "<Right>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true, silent = true, desc = "Codeium Accept" })
		vim.keymap.set("i", "<C-n>", function()
			return vim.fn["codeium#CycleCompletions"](1)
		end, { expr = true, silent = true, desc = "Codeium Cycle Completions" })
	end,
}
