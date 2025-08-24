return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"saghen/blink.cmp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities() -- Import capabilities from blink.cmp
		local lspconfig = require("lspconfig")

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable document highlight if supported by the LSP server
				-- local client = vim.lsp.get_client_by_id(ev.data.client_id)
				-- local bufnr = ev.buf

				-- if client and client.server_capabilities.documentHighlightProvider then
				-- 	local highlight_augroup = vim.api.nvim_create_augroup("lsp_document_highlight", {
				-- 		clear = false,
				-- 	})
				-- 	vim.opt.updatetime = 60 -- 60ms instead of default 4000ms
				--
				-- 	vim.api.nvim_clear_autocmds({
				-- 		buffer = bufnr,
				-- 		group = highlight_augroup,
				-- 	})
				-- 	vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				-- 		group = highlight_augroup,
				-- 		buffer = bufnr,
				-- 		callback = vim.lsp.buf.document_highlight,
				-- 	})
				-- 	vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				-- 		group = highlight_augroup,
				-- 		buffer = bufnr,
				-- 		callback = vim.lsp.buf.clear_references,
				-- 	})
				-- end
				--
				-- Buffer local mappings
				-- Check `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- keymaps
				opts.desc = "Show LSP references"
				vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

				opts.desc = "Go to declaration"
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "Show LSP definitions"
				vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"
				vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "See available code actions"
				vim.keymap.set({ "n", "v" }, "<leader>vca", function()
					vim.lsp.buf.code_action()
				end, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Show buffer diagnostics"
				vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

				opts.desc = "Show line diagnostics"
				vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Show documentation for what is under cursor"
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				opts.desc = "Restart LSP"
				vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

				vim.keymap.set("i", "<C-h>", function()
					vim.lsp.buf.signature_help()
				end, opts)
			end,
		})

		-- Define sign icons for each severity
		local signs = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = "󰠠 ",
			[vim.diagnostic.severity.INFO] = " ",
		}

		-- Set the diagnostic config with all icons
		vim.diagnostic.config({
			signs = {
				text = signs, -- Enable signs in the gutter
			},
			virtual_text = true, -- Specify Enable virtual text for diagnostics
			underline = true, -- Specify Underline diagnostics
			update_in_insert = false, -- Keep diagnostics active in insert mode
		})

		-- Lua LSP setup
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					completion = {
						callSnippet = "Replace",
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		-- Go LSP setup
		lspconfig.gopls.setup({ capabilities = capabilities })

		-- Kotlin LSP setup
		lspconfig.kotlin_lsp.setup({ capabilities = capabilities })

		-- Add other LSP servers here
	end,
}
