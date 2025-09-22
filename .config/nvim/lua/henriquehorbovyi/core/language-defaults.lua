-- Language-specific indentation and formatting settings

-- Go-specific settings
vim.api.nvim_create_autocmd("FileType", {
	pattern = "go",
	callback = function()
		vim.bo.tabstop = 4
		vim.bo.shiftwidth = 4
		vim.bo.expandtab = false -- Go uses tabs, not spaces
		vim.bo.makeprg = "go run %"
		vim.bo.errorformat = "%f:%l:%c: %t%*[^:]:%m"
	end,
})

-- C/C++-specific settings
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp" },
	callback = function()
		vim.bo.tabstop = 4
		vim.bo.shiftwidth = 4
		vim.bo.expandtab = false -- I want to use tabs in C :)
		vim.bo.makeprg = "gcc % -o %< && ./%<"
		vim.bo.errorformat = "%f:%l:%c: %t%*[^:]:%m"
	end,
})

-- Kotlin-specific settings
vim.api.nvim_create_autocmd("FileType", {
	pattern = "kotlin",
	callback = function()
		vim.bo.tabstop = 4
		vim.bo.shiftwidth = 4
		vim.bo.expandtab = false
		-- vim.bo.makeprg = "kotlinc % -include-runtime -d %<.jar && java -jar %<.jar"
		vim.bo.makeprg = "kotlinc-native % -o out && ./out.kexe"
		vim.bo.errorformat = "%f:%l:%c: %t%*[^:]:%m"
	end,
})

-- Optional: Add more language-specific settings here
-- Example for other languages you might use:

-- Python settings
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.bo.tabstop = 4
		vim.bo.shiftwidth = 4
		vim.bo.expandtab = true
		vim.bo.makeprg = "python3 %"
		vim.bo.errorformat = "%f:%l:%c: %t%*[^:]:%m"
	end,
})

-- Lua settings
vim.api.nvim_create_autocmd("FileType", {
	pattern = "lua",
	callback = function()
		vim.bo.tabstop = 2
		vim.bo.shiftwidth = 2
		vim.bo.expandtab = true
	end,
})
