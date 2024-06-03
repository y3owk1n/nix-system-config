-- local augroup = require("k92.utils.autocmds").augroup

local usercmd = vim.api.nvim_create_user_command

usercmd("TailwindSortRun", function()
	local tailwind_sort = require("k92.utils.tailwind-sort")
	tailwind_sort.run()
end, {})

usercmd("TailwindSortStatus", function()
	local tailwind_sort = require("k92.utils.tailwind-sort")
	vim.notify(
		"TailwindSort Status: " .. vim.inspect(tailwind_sort.get_status()),
		vim.log.levels.INFO
	)
end, {})

usercmd("TailwindSortEnable", function()
	local tailwind_sort = require("k92.utils.tailwind-sort")
	local status = tailwind_sort.toggle_status(true)
	vim.notify(
		"TailwindSort Status: " .. vim.inspect(status),
		vim.log.levels.INFO
	)
end, {})

usercmd("TailwindSortDisable", function()
	local tailwind_sort = require("k92.utils.tailwind-sort")
	local status = tailwind_sort.toggle_status(false)
	vim.notify(
		"TailwindSort Status: " .. vim.inspect(status),
		vim.log.levels.INFO
	)
end, {})
