return {
	"j-hui/fidget.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	opts = {
		notification = {
			window = {
				winblend = 0,
			},
		},
	},
}
