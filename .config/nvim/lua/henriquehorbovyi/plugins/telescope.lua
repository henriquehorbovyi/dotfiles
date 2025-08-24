-- ~/.config/nvim/lua/plugins/telescope.lua
-- Telescope fuzzy finder configuration

return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
        "nvim-telescope/telescope-ui-select.nvim",
        "folke/todo-comments.nvim",
    },

    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                prompt_prefix = " ",
                selection_caret = "→ ",
                entry_prefix = "  ",

                path_display = { "smart" },
                sorting_strategy = "ascending",
                -- Maybe vertical when I'm using my laptop screen only
                layout_strategy = 'horizontal', -- or 'vertical', 'center', 'cursor'
                layout_config = {
                    horizontal = {
                        preview_width = 0.6, -- 60% of screen width for preview
                        results_width = 0.4, -- 40% for results
                        preview_cutoff = 80, -- hide preview if window < 80 columns
                    },
                    vertical = {
                        preview_height = 0.5, -- 50% of screen height for preview
                        results_height = 0.5, -- 50% for results
                        preview_cutoff = 20,  -- hide preview if window < 20 lines
                    },
                    center = {
                        preview_cutoff = 40,
                    }
                },
                preview = {
                    hide_on_startup = false, -- show preview by default
                    filesize_limit = 25,     -- MB - don't preview files larger than this
                    timeout = 250,           -- ms - preview timeout
                    treesitter = true,       -- use treesitter for syntax highlighting
                },
                mappings = {
                    i = {
                        ["<C-n>"] = actions.cycle_history_next,
                        ["<C-p>"] = actions.cycle_history_prev,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-c>"] = actions.close,
                        ["<Down>"] = actions.move_selection_next,
                        ["<Up>"] = actions.move_selection_previous,
                        ["<CR>"] = actions.select_default,
                        ["<C-x>"] = actions.select_horizontal,
                        ["<C-v>"] = actions.select_vertical,
                        ["<C-t>"] = actions.select_tab, -- open selection in new tab
                        ["<C-u>"] = actions.preview_scrolling_up,
                        ["<C-d>"] = actions.preview_scrolling_down,
                    },
                    n = {
                        ["<esc>"] = actions.close,
                        ["<CR>"] = actions.select_default,
                        ["<C-x>"] = actions.select_horizontal,
                        ["<C-v>"] = actions.select_vertical,
                        ["<C-t>"] = actions.select_tab,
                        ["j"] = actions.move_selection_next,
                        ["k"] = actions.move_selection_previous,
                        ["H"] = actions.move_to_top,
                        ["M"] = actions.move_to_middle,
                        ["L"] = actions.move_to_bottom,
                        ["<C-u>"] = actions.preview_scrolling_up,
                        ["<C-d>"] = actions.preview_scrolling_down,
                        ["q"] = actions.close,
                    },
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                    file_ignore_patterns = {
                        "node_modules",
                        ".git",
                        ".venv",
                        ".idea",
                        ".gradle"
                    },
                },
                live_grep = {
                    additional_args = function()
                        return { "--hidden" }
                    end,
                    file_ignore_patterns = {
                        "node_modules",
                        ".git",
                        ".venv",
                        ".idea",
                        ".gradle"
                    },
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({}),
                },
            },
        })

        -- Load extensions
        pcall(telescope.load_extension, "fzf")
        pcall(telescope.load_extension, "ui-select")

        -- Set keymaps
        local builtin = require("telescope.builtin")
        local map = vim.keymap.set

        map("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
        map("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
        map("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
        map("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
        map("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
        map("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
        map("n", "<leader>fs", builtin.builtin, { desc = "[F]ind [S]elect Telescope" })
        map("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
        map("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume" })
        map("n", "<leader>f.", builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
        map("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
        map("n", "<leader>ft", ":TodoTelescope<cr>", { desc = "Find TODOS" })

        -- Slightly advanced example: search in current buffer
        map("n", "<leader>/", function()
            builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                winblend = 10,
                previewer = false,
            }))
        end, { desc = "[/] Fuzzily search in current buffer" })
    end,
}
