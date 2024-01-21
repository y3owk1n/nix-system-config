local M = {}

M.find_root = function(ctx, file_patterns)
	return vim.fs.find(file_patterns, { path = ctx.filename, upward = true })[1]
end

return M
