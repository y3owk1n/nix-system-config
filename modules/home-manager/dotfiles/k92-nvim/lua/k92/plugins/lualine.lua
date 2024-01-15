return {
	"nvim-lualine/lualine.nvim",
	event = { "VeryLazy" }, -- to disable, comment this out
	dependencies = { "nvim-tree/nvim-web-devicons" },
	init = function()
		vim.g.lualine_laststatus = vim.o.laststatus
		if vim.fn.argc(-1) > 0 then
			-- set an empty statusline till lualine loads
			vim.o.statusline = " "
		else
			-- hide the statusline on the starter page
			vim.o.laststatus = 0
		end
	end,
	config = function()
		-- PERF: we don't need this lualine require madness 🤷
		local lualine_require = require("lualine_require")
		lualine_require.require = require

		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		vim.o.laststatus = vim.g.lualine_laststatus

		local show_codeium_status_string = function()
			return vim.fn["codeium#GetStatusString"]()
		end

		local show_startuptime = function()
			local stats = require("lazy").stats()
			local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
			return (
				"⚡ "
				.. stats.loaded
				.. "/"
				.. stats.count
				.. " ("
				.. ms
				.. "ms)"
			)
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
					{ show_startuptime },
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
