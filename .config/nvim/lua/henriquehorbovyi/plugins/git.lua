return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("neogit").setup({
				status = {
					recent_commit_include_author_info = true,
				},
			})
			vim.keymap.set("n", "<leader>gg", ":Neogit kind=floating<CR>", { desc = "Git (Neogit floating)" })
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk_inline<CR>", { desc = "Preview git changes" })
		end,
	},
}
