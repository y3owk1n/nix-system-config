-- local augroup = require("k92.utils.autocmds").augroup

local usercmd = vim.api.nvim_create_user_command

usercmd("TailwindSortRun", function()
	local tailwind_sort = require("k92.utils.tailwind-sort")

	-- No need to check for autorun flag & prettier tw plugin existence
	-- This is on demand run
	-- Tailwind LSP will be checked in the run function

	vim.schedule(function() -- Schedule to run after current operations complete
		tailwind_sort.run()
	end)
end, {})

usercmd("TailwindSortStatus", function()
	local tailwind_sort = require("k92.utils.tailwind-sort")
	vim.notify(
		"TailwindSort Status: " .. vim.inspect(tailwind_sort.get_status()),
		vim.log.levels.INFO
	)
end, {
	desc = "Check TailwindSort auto format status",
})

usercmd("TailwindSortEnable", function()
	local tailwind_sort = require("k92.utils.tailwind-sort")
	tailwind_sort.toggle_status(true)
	vim.notify("Enabled TailwindSort auto format on save")
end, {
	desc = "Enable TailwindSort auto format on save",
})

usercmd("TailwindSortDisable", function()
	local tailwind_sort = require("k92.utils.tailwind-sort")
	tailwind_sort.toggle_status(false)
	vim.notify("Disabled TailwindSort auto format on save")
end, {
	desc = "Disable TailwindSort auto format on save",
})
