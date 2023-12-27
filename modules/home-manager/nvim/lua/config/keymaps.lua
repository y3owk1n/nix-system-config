-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

local del = vim.keymap.del

-- delete keymaps
del("n", "<leader>ww")
del("n", "<leader>wd")
del("n", "<leader>w-")
del("n", "<leader>w|")
del("n", "<leader>-")
del("n", "<leader>|")
del("n", "<leader><tab>l")
del("n", "<leader><tab>f")
del("n", "<leader><tab><tab>")
del("n", "<leader><tab>]")
del("n", "<leader><tab>d")
del("n", "<leader><tab>[")
del("n", "<leader>`")
del("n", "<leader>,")
del("n", "<leader>bb")
-- del("n", "<C-h>")
-- del("n", "<C-j>")
-- del("n", "<C-k>")
-- del("n", "<C-l>")
-- del("n", "<C-Up>")
-- del("n", "<C-Down>")
-- del("n", "<C-Left>")
-- del("n", "<C-Right>")
del("n", "<A-j>")
del("n", "<A-k>")
del("i", "<A-j>")
del("i", "<A-k>")
del("v", "<A-j>")
del("v", "<A-k>")
del("n", "<S-h>")
del("n", "<S-l>")
del("n", "]b")
del("n", "[b")

-- window
map("n", "-", "<C-W>s", { desc = "Split window below" })
map("n", "|", "<C-W>v", { desc = "Split window right" })
map("n", "<leader>wx", ":close<CR>", { desc = "Close current split" })

-- telescope
map("n", "<leader>sx", require("telescope.builtin").resume, { desc = "Resume last picker" })

-- util
map("n", "<leader>W", "<cmd>w<cr>", { desc = "Save" })
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up and center" })
map("n", "n", "nzzzv", { desc = "Search next and center" })
map("n", "N", "Nzzzv", { desc = "Search previous and center" })
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move line up" })
map("v", "K", ":m '>-2<cr>gv=gv", { desc = "Move line down" })

-- color conversion
map("n", "<leader>ch", function()
  require("utils.color-conversion").replaceHexWithHSL()
end, {
  desc = "Replace Hex With HSL",
})
