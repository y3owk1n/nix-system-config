return {
	"luckasRanarison/tailwind-tools.nvim",
	lazy = true,
	event = "LspAttach",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	keys = {
		{
			"<leader>cf",
			":TailwindSort<cr>",
			desc = "Tailwind Sort Format",
		},
	},
	opts = {
		document_color = {
			enabled = false,
		},
	},
}
