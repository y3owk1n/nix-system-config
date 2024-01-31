local keymap = require("k92.utils.keymaps")
local map = keymap.map
local terminal = require("k92.utils.terminal")

-- better up/down
map(
	{ "n", "x" },
	"j",
	"v:count == 0 ? 'gj' : 'j'",
	{ expr = true, silent = true, desc = "Move line down" }
)
map(
	{ "n", "x" },
	"<Down>",
	"v:count == 0 ? 'gj' : 'j'",
	{ expr = true, silent = true, desc = "Move line down" }
)
map(
	{ "n", "x" },
	"k",
	"v:count == 0 ? 'gk' : 'k'",
	{ expr = true, silent = true, desc = "Move line up" }
)
map(
	{ "n", "x" },
	"<Up>",
	"v:count == 0 ? 'gk' : 'k'",
	{ expr = true, silent = true, desc = "Move line up" }
)

-- better start & end line
map({ "n", "v" }, "H", "^", { desc = "Move to start of line" })
map({ "n", "v" }, "L", "$", { desc = "Move to end of line" })

-- better redo
map("n", "U", "<C-r>", { desc = "Dedent line" })

-- better indenting
map("v", "<", "<gv", { desc = "Dedent line" })
map("v", ">", ">gv", { desc = "Indent line" })

-- window
map("n", "-", "<C-W>s", { desc = "Split window below" })
map("n", "\\", "<C-W>v", { desc = "Split window right" })
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
map(
	"n",
	"<leader>fx",
	"<cmd>!chmod +x %<cr>",
	{ desc = "Make file executable" }
)
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move line up" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move line down" })

-- lazygit
map("n", "<leader>gg", function()
	terminal({ "lazygit" }, { esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazygit (cwd)" })

-- color conversion
map("n", "<leader>ch", function()
	require("utils.color").replaceHexWithHSL()
end, {
	desc = "Replace Hex With HSL",
})
