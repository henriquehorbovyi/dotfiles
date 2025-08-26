vim.cmd("let g:netrw_liststyle = 3")
local opt = vim.opt

opt.guicursor = ""

opt.nu = true
opt.relativenumber = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.wrap = false

-- Case sentitive for searching
-- opt.hlsearch = true
-- opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- line highlight
opt.cursorline = true

-- True color terminal
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Backspace
opt.backspace = "indent,eol,start" -- allow backspace to indent

-- Clipboard is set as default
-- opt.clipboard:append("unnamedplus") -- use system clipboard as default register
