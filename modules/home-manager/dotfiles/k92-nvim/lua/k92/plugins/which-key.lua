return {
	"folke/which-key.nvim",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		plugins = { spelling = true },
		defaults = {
			mode = { "n", "v" },
			["g"] = { name = "+goto" },
			["gs"] = { name = "+surround" },
			["]"] = { name = "+next" },
			["["] = { name = "+prev" },
			["<leader>c"] = { name = "+code" },
			["<leader>l"] = { name = "+lsp" },
			["<leader>f"] = { name = "+file/find" },
			["<leader>g"] = { name = "+git" },
			["<leader>h"] = { name = "+harpoon" },
			["<leader>m"] = { name = "+move" },
			["<leader>s"] = { name = "+search" },
			["<leader>w"] = { name = "+windows" },
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.register(opts.defaults)
	end,
}
