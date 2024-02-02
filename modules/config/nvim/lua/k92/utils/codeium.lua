local M = {}

M.show_codeium_status_string = function()
	return vim.fn["codeium#GetStatusString"]()
end

return M
