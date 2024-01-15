local keymap = require("k92.utils.keymaps")
local map = keymap.map

-- better up/down
map(
	{ "n", "x" },
	"j",
	"v:count == 0 ? 'gj' : 'j'",
	{ expr = true, silent = true }
)
map(
	{ "n", "x" },
	"<Down>",
	"v:count == 0 ? 'gj' : 'j'",
	{ expr = true, silent = true }
)
map(
	{ "n", "x" },
	"k",
	"v:count == 0 ? 'gk' : 'k'",
	{ expr = true, silent = true }
)
map(
	{ "n", "x" },
	"<Up>",
	"v:count == 0 ? 'gk' : 'k'",
	{ expr = true, silent = true }
)

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- window
map("n", "-", "<C-W>s", { desc = "Split window below" })
map("n", "|", "<C-W>v", { desc = "Split window right" })
map("n", "<leader>wx", ":close<CR>", { desc = "Close current split" })

-- Clear search with <esc>
map(
	{ "i", "n" },
	"<esc>",
	"<cmd>noh<cr><esc>",
	{ desc = "Escape and clear hlsearch" }
)

-- util
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up and center" })
map("n", "n", "nzzzv", { desc = "Search next and center" })
map("n", "N", "Nzzzv", { desc = "Search previous and center" })
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move line up" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move line down" })

-- color conversion
map("n", "<leader>ch", function()
	require("utils.color").replaceHexWithHSL()
end, {
	desc = "Replace Hex With HSL",
})
