-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Better start & end line
vim.keymap.set({ "n", "v" }, "H", "^", { desc = "Move to start of line" })
vim.keymap.set({ "n", "v" }, "L", "$", { desc = "Move to end of line" })

-- Better yank
vim.keymap.set("x", "y", "ygv<Esc>", { desc = "Yank block and remain cursor", noremap = true, silent = true })

--- Window management
vim.keymap.del("n", "<leader>wd")
vim.keymap.del("n", "<leader>-")
vim.keymap.del("n", "<leader>|")
vim.keymap.set("n", "-", "<C-W>s", { desc = "Split Window Below", remap = true })
vim.keymap.set("n", "\\", "<C-W>v", { desc = "Split Window Right", remap = true })
vim.keymap.set("n", "<leader>wx", "<C-W>c", { desc = "Close current split", remap = true })

--- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

--- Center page during actions
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up and center" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Search next and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Search previous and center" })

--- Do things without affecting the registers
vim.keymap.set("n", "x", '"_x', { desc = "Delete a character without copying it" })
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without replacing" })
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without replacing" })

--- Find/replace for the word under the cursor
vim.keymap.set("n", "<leader>r", function()
  local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
  local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
  vim.api.nvim_feedkeys(keys, "n", false)
end, { desc = "Replace word under cursor" })

--- Move lines
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move line up" })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move line down" })

-- No op
vim.keymap.set("n", "Q", "<nop>", { desc = "No op" })
