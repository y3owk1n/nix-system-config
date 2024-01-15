local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup(
	{ { import = "k92.plugins" }, { import = "k92.plugins.lsp" } },
	{
		install = {
			colorscheme = { "catppuccin" },
		},
		checker = {
			enabled = true,
			notify = false,
		},
		change_detection = {
			notify = false,
		},
		performance = {
			rtp = {
				-- disable some rtp plugins
				disabled_plugins = {
					"gzip",
					"matchit",
					"matchparen",
					"netrwPlugin",
					"tarPlugin",
					"tohtml",
					"tutor",
					"zipPlugin",
				},
			},
		},
	}
)
