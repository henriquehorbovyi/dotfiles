return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				kotlin = { "ktlint" },
				go = { "goimports", "gofmt" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier", "marksman" },
				lua = { "stylua" },
			},
			formatters = {
				clang_format = {
					prepend_args = { "--style={IndentWidth: 4, TabWidth: 4, UseTab: Always}" },
				},
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 3000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>gf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
