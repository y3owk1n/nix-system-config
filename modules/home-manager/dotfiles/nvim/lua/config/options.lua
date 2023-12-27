-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
local global = vim.g
local cmd = vim.cmd

-- disable some extension providers
global.loaded_python3_provider = 0
global.loaded_ruby_provider = 0
global.loaded_node_provider = 0
global.loaded_perl_provider = 0

-- encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
vim.scriptencoding = "utf-8"

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- Width
opt.colorcolumn = "80" -- make width to 80

-- tabs & indentation
opt.tabstop = 4 -- 4 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.softtabstop = 4 -- 4 spaces for softtab
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.hlsearch = false -- do not highlight search
opt.incsearch = true -- follow the searches

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- scroll
opt.scrolloff = 8 -- set scroll offset to maximum lines (will always be in middle)

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- words
opt.iskeyword:append("-") -- consider string-string as whole words
opt.fillchars = { eob = " " }

-- turn off swapfile
opt.swapfile = false

-- enable undercurl
cmd([[let &t_Cs = "\e[4:3m]"]])
cmd([[let &t_Ce = "\e[4:0m]"]])

-- Add astericks in block comments
opt.formatoptions:append({ "r" })

if vim.fn.has("nvim-0.8") == 1 then
  vim.opt.cmdheight = 0
end
