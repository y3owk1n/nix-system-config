local keymap = require("k92.utils.keymaps")
local map = keymap.map

return {
	{
		-- "kevinhwang91/nvim-ufo",
		-- event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		-- dependencies = {
		-- 	"kevinhwang91/promise-async",
		-- },
		-- config = function()
		-- 	local ufo = require("ufo")
		-- 	ufo.setup({
		-- 		provider_selector = function(_bufnr, _filetype, _buftype)
		-- 			return { "treesitter", "indent" }
		-- 		end,
		-- 	})
		--
		-- 	map("n", "zR", function()
		-- 		ufo.openAllFolds()
		-- 	end, { desc = "Open all folds" })
		--
		-- 	map("n", "zM", function()
		-- 		ufo.closeAllFolds()
		-- 	end, { desc = "Close all folds" })
		-- end,
	},
}
