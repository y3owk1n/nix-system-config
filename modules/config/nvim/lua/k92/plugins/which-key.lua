return {
	"folke/which-key.nvim",
	lazy = true,
	event = "VeryLazy",

	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		plugins = { spelling = true },
		window = {
			border = "rounded", -- none, single, double, shadow
		},
		defaults = {
			mode = { "n", "v" },
			["g"] = { name = "+goto" },
			["gs"] = { name = "+surround" },
			["]"] = { name = "+next" },
			["["] = { name = "+prev" },
			["<leader>c"] = { name = "+[c]ode" },
			["<leader>l"] = { name = "+[l]sp" },
			["<leader>lb"] = { name = "+[l]sp [b]uiltin" },
			["<leader>f"] = { name = "+[f]ile" },
			["<leader>g"] = { name = "+[g]it" },
			["<leader>h"] = { name = "+[h]arpoon" },
			["<leader>s"] = { name = "+[s]earch" },
			["<leader>w"] = { name = "+[w]indows" },
			["<leader>x"] = { name = "+[t]rouble" },
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.register(opts.defaults)
	end,
}
