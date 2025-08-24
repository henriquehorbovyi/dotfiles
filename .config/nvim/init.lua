-- ~/.config/nvim/init.lua
-- Main configuration entry point

-- Set leader keys before loading lazy.nvim
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Kotlin LSP import setup
vim.lsp.enable("kotlin_lsp", true)
vim.lsp.config("kotlin_lsp", {
	single_file_support = false,
})

require("henriquehorbovyi.core")
require("henriquehorbovyi.lazy")
