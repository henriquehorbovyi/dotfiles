vim.g.mapleader = " "
local keymap = vim.keymap

-- Return to normal mode
keymap.set("i", "kj", "<Esc>")

-- keymap.set('n', '<leader>s', ":source %<CR>", { desc = "Source file" })

-- keymap.set("n", "<leader>ex", vim.cmd.Ex) -- Exit file
keymap.set("n", "<leader>ex", ":exit<CR>") -- Exit file
-- Lazy
keymap.set("n", "<leader>la", vim.cmd.La) -- Lazy Package Manager

-- Override 0 and $ for start and end of line
keymap.set("n", "B", "^")
keymap.set("n", "E", "$")
keymap.set("v", "E", "$")
keymap.set("v", "B", "$")

-- Yanks to clipboard
keymap.set("v", "<leader>y", '"+y')
keymap.set("n", "<leader>y", '"+y')
keymap.set("n", "<leader>Y", '"+Y')

-- Moves line up and donw using K and J in Visual Mode
keymap.set("v", "K", ":m  '<-2<CR>gv=gv")
keymap.set("v", "J", ":m  '>+1<CR>gv=gv")

keymap.set("v", "<leader>{", 'c{<C-r>"}<Esc>')
keymap.set("v", "<leader>(", 'c(<C-r>")<Esc>')
keymap.set("v", "<leader>[", 'c[<C-r>"]<Esc>')
keymap.set("v", '<leader>"', 'c"<C-r>""<Esc>')

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "No highlight / Clear highlight" })

-- Tabs management
-- keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
-- keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
-- keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
-- keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
-- keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Buffer management (replaces tab management when using bufferline)
keymap.set("n", "<leader>to", "<cmd>enew<CR>", { desc = "Open new buffer" })
keymap.set("n", "<leader>tx", "<cmd>bdelete<CR>", { desc = "Close current buffer" })
vim.keymap.set("n", "<leader>tX", "<cmd>%bdelete<CR>", { desc = "Close all buffers" })
-- keymap.set("n", "<leader>tn", "<cmd>BufferLineCycleNext<CR>", { desc = "Go to next buffer" })
-- keymap.set("n", "<leader>tp", "<cmd>BufferLineCyclePrev<CR>", { desc = "Go to previous buffer" })
keymap.set("n", "<leader>tf", "<cmd>enew | edit %<CR>", { desc = "Open current buffer in new buffer" })
vim.keymap.set("n", "<leader>tn", "<cmd>bnext<CR>", { desc = "Go to next buffer" })
vim.keymap.set("n", "<leader>tp", "<cmd>bprevious<CR>", { desc = "Go to previous buffer" })

-- File explorer
keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>")
keymap.set("n", "<leader>er", ":NvimTreeRefresh<CR>")

-- Window management
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split (W)indow (V)ertically" })
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split (W)indow (H)orizontally" })
keymap.set("n", "<leader>we", "<C-w>=", { desc = "(W)indow (E)qually Displayed" })
keymap.set("n", "<leader>wq", "<C-w>q", { desc = "(W)indow (Q)uit" })

-- Make / Run projects
keymap.set("n", "<leader>r", ":update<CR> :make<CR>")
