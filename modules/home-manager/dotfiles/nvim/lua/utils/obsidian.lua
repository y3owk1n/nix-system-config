local obsidian = {}

obsidian.findRoot = function()
  local current_dir = vim.fn.expand("%:p:h") -- Get the current directory of the open file

  while current_dir ~= "/" do
    local obsidian_config = current_dir .. "/.obsidian.vimrc"
    local file_exists = vim.fn.filereadable(obsidian_config)

    if file_exists == 1 then
      -- return obsidian_config
      return true
    end

    current_dir = vim.fn.fnamemodify(current_dir, ":h") -- Move up one directory
  end

  return false -- .obsidian file not found
end

return obsidian
