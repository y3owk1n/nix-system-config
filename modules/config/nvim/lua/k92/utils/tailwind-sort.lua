local parsers = require("nvim-treesitter.parsers")

local M = {}

local supported_filetypes = {
	"javascriptreact",
	"typescriptreact",
}

M.enabled = true

M.get_status = function()
	return M.enabled
end

---@param status boolean?
M.toggle_status = function(status)
	M.enabled = status
	return status
end

---@return boolean
M.check_prettier_tw_plugin = function()
	local file_util = require("k92.utils.file")

	local prettier_file_pattern = {
		"prettier",
		".prettierrc",
		".prettierrc.json",
		".prettierrc.yml",
		".prettierrc.yaml",
		".prettierrc.json5",
		".prettierrc.js",
		"prettier.config.js",
		".prettierrc.mjs",
		"prettier.config.mjs",
		".prettierrc.cjs",
		"prettier.config.cjs",
		".prettierrc.toml",
	}

	local ctx = {}
	ctx.filename = vim.fn.expand("%:p")

	local prettier_root = file_util.find_root(ctx, prettier_file_pattern)

	if not prettier_root then
		return false
	end

	local prettier_root_path =
		file_util.current_file_path_absolute(prettier_root)

	local result = file_util.find_text_in_file(
		"prettier-plugin-tailwindcss",
		prettier_root_path
	)

	if not result then
		return false
	end

	return true
end

---@return vim.lsp.Client?
M.get_tw_lsp_client = function()
	---@diagnostic disable-next-line: deprecated
	local get_client = vim.lsp.get_clients or vim.lsp.get_active_clients
	local clients = get_client({ name = "tailwindcss" })
	return clients[1]
end

M.run = function()
	local client = M.get_tw_lsp_client()

	if not client then
		return vim.notify(
			"tailwind-language-server is not running, run :TailwindSortDisable to disable auto run",
			vim.log.levels.WARN
		)
	end

	local bufnr = vim.api.nvim_get_current_buf()
	local params = vim.lsp.util.make_text_document_params(bufnr)
	local class_nodes = M.get_class_nodes(bufnr, true)

	if not class_nodes then
		return
	end

	local class_text = {}
	local class_ranges = {}

	for _, node in pairs(class_nodes) do
		local start_row, start_col, end_row, end_col =
			M.get_class_range(node, bufnr)
		local text = vim.api.nvim_buf_get_text(
			bufnr,
			start_row,
			start_col,
			end_row,
			end_col,
			{}
		)

		class_text[#class_text + 1] = table.concat(text, "\n")
		class_ranges[#class_ranges + 1] =
			{ start_row, start_col, end_row, end_col }
	end

	params.classLists = class_text
	client.request(
		"@/tailwindCSS/sortSelection",
		params,
		function(err, result, _, _)
			if err then
				return vim.notify(err.message, vim.log.levels.ERROR)
			end
			if result.error then
				return vim.notify(result.error, vim.log.levels.ERROR)
			end
			if not result or not vim.api.nvim_buf_is_valid(bufnr) then
				return
			end

			for i, edit in pairs(result.classLists) do
				local lines = vim.split(edit, "\n")

				for j, line in ipairs(lines) do
					-- Remove extra spaces between class names
					line = line:gsub("%s+", " ")
					-- Trim leading and trailing spaces
					line = line:gsub("^%s*(.-)%s*$", "%1")
					lines[j] = line
				end

				local start_row, start_col, end_row, end_col =
					unpack(class_ranges[i])

				local set_text = function()
					vim.api.nvim_buf_set_text(
						bufnr,
						start_row,
						start_col,
						end_row,
						end_col,
						lines
					)
				end
				-- Dismiss useless error messages when undoing in nightly
				pcall(set_text)
			end

			vim.notify("Tailwind class sorted", vim.log.levels.INFO)
		end,
		bufnr
	)
end

---@param bufnr number
---@param all boolean?
M.get_class_nodes = function(bufnr, all)
	local ft = vim.bo[bufnr].ft
	local filetypes = vim.tbl_extend("keep", {}, supported_filetypes)
	local results = {}

	if not vim.tbl_contains(filetypes, ft) then
		return
	end

	local parser = parsers.get_parser(bufnr)

	if not parser then
		local message = string.format("No parser available for %s", ft)
		return vim.notify(message, vim.log.levels.WARN)
	end

	if all and vim.version().minor == 10 then
		parser:parse(true)
	end

	parser:for_each_tree(function(tree, lang_tree)
		local root = tree:root()
		local lang = lang_tree:lang()

		local queries = { "class", "cva", "cn" }

		for _, query_name in ipairs(queries) do
			local query = vim.treesitter.query.get(lang, query_name)

			-- if not query then
			-- 	return vim.notify(
			-- 		"No query for " .. query_name,
			-- 		vim.log.levels.WARN
			-- 	)
			-- end

			if query then
				for id, node in
					query:iter_captures(root, bufnr, 0, -1, { all = true })
				do
					if
						query.captures[id] == "tailwind"
						or query.captures[id] == "cva_class"
						or query.captures[id] == "variant_class"
						or query.captures[id] == "cn_class"
					then
						results[#results + 1] = node
					end
				end
			end
		end
	end)

	return results
end

---@param node TSNode
---@param bufnr number
M.get_class_range = function(node, bufnr)
	local start_row, start_col, end_row, end_col = node:range()
	local children = node:named_children()

	-- A special case for extracting postcss class range
	if
		children[1]
		and vim.treesitter.get_node_text(children[1], bufnr) == "@apply"
	then
		start_row, start_col, _, _ = children[2]:range()
		_, _, end_row, end_col = children[#children]:range()
	end

	return start_row, start_col, end_row, end_col
end

return M
