return {
	"williamboman/mason.nvim",
	lazy = false,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"neovim/nvim-lspconfig",
	},

	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- NOTE: Moved these local imports below back to lspconfig.lua due to mason depracated handlers

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			automatic_enable = true,
			-- servers for mason to install
			ensure_installed = {
				"lua_ls",
				"bashls",
				"gopls",
				"clangd",
				"kotlin_lsp",
				"kotlin_language_server",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"stylua",
				"clangd",
				"goimports",
				"gofumpt",
				"ktlint",
				"clang-format",
				"shellcheck",
				"delve", -- Go debugger
			},
		})
	end,
}
