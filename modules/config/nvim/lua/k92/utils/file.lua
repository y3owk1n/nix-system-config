local M = {}

M.find_root = function(ctx, file_patterns)
	return vim.fs.find(file_patterns, { path = ctx.filename, upward = true })[1]
end

M.current_file_path_relative = function()
	return vim.fn.fnamemodify(vim.fn.expand("%:p"), ":~:.")
end

return M
