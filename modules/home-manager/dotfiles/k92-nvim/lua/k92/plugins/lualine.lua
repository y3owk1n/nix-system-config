return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = "catppuccin",
				component_separators = {
					left = "",
					right = "",
				},
				section_separators = {
					left = "",
					right = "",
				},
			},
			sections = {
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					-- {
					-- 	vim.fn["codeium#GetStatusString"](),
					-- },
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
			extensions = { "lazy", "mason", "neo-tree", "quickfix", "trouble" },
		})
	end,
}
