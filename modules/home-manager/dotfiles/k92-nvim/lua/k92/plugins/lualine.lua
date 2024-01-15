return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		local show_codeium_status_string = function()
			return vim.fn["codeium#GetStatusString"]()
		end

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = "catppuccin",
				globalstatus = true,
				disabled_filetypes = {
					statusline = { "dashboard", "alpha", "starter" },
				},
				component_separators = {
					left = " ",
					right = " ",
				},
				section_separators = {
					left = "",
					right = "",
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					{ "branch" },
					{
						"diff",
						symbols = {
							added = " ",
							modified = " ",
							removed = " ",
						},
					},
				},
				lualine_c = {
					{ "filename" },
					{
						"diagnostics",
						symbols = {
							error = " ",
							warn = " ",
							info = " ",
							hint = " ",
						},
					},
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{
						show_codeium_status_string,
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
			extensions = { "lazy", "mason", "neo-tree", "quickfix", "trouble" },
		})
	end,
}
