-- Hightlight usages of variables and functions
return {
	"RRethy/vim-illuminate",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		-- providers: priority order for illumination providers
		providers = {
			"lsp",
			"treesitter",
			-- 'regex', -- uncomment if you want regex fallback
		},
		-- delay: delay in milliseconds
		delay = 60,
		-- filetypes_denylist: filetypes to not illuminate
		filetypes_denylist = {
			"dirbuf",
			"dirvish",
			"fugitive",
		},
		-- filetypes_allowlist: only illuminate for these filetypes
		-- filetypes_allowlist = {},
		-- modes_denylist: modes to not illuminate
		modes_denylist = {},
		-- modes_allowlist: only illuminate in these modes
		-- modes_allowlist = {},
		-- providers_regex_syntax_denylist: syntax to avoid illuminating
		providers_regex_syntax_denylist = {},
		-- providers_regex_syntax_allowlist: only illuminate these syntax groups
		-- providers_regex_syntax_allowlist = {},
		-- under_cursor: whether or not to illuminate under the cursor
		under_cursor = true,
		-- large_file_cutoff: number of lines at which to use large_file_config
		large_file_cutoff = nil,
		-- large_file_overrides: config to use for large files (takes precedence over default)
		large_file_overrides = nil,
		-- min_count_to_highlight: minimum number of matches required to perform highlighting
		min_count_to_highlight = 1,
		-- should_illuminate: a callback that overrides all other settings to
		-- enable/disable illumination. This will be called a lot so don't do
		-- anything expensive in it.
		should_illuminate = function(bufnr)
			-- Don't illuminate for certain filetypes
			local filetype = vim.bo[bufnr].filetype
			if filetype == "help" or filetype == "alpha" or filetype == "dashboard" then
				return false
			end
			return true
		end,
	},
	config = function(_, opts)
		require("illuminate").configure(opts)

		-- Optional: Set custom highlight colors
		vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#3c4048" })
		vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#3c4048" })
		vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#4a5568" })

		-- Keymaps for navigating between references (silent navigation)
		local function map(key, dir, buffer)
			vim.keymap.set("n", key, function()
				-- Suppress messages by wrapping in pcall and using silent mode
				local _, _ = pcall(function()
					require("illuminate")["goto_" .. dir .. "_reference"](true) -- true = wrap around silently
				end)
			end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer, silent = true })
		end

		map("]h", "next")
		map("[h", "prev")

		-- Alternative keymaps (uncomment if you prefer these)
		-- map("<a-n>", "next")
		-- map("<a-p>", "prev")
	end,
}
