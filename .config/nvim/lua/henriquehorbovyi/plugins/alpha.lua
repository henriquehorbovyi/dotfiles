-- Alpha Dashboard Plugin Configuration
return {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local alpha = require('alpha')
        local dashboard = require('alpha.themes.dashboard')

        -- Custom ASCII art header
        dashboard.section.header.val = {
            "                                                     ",
            "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
            "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
            "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
            "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
            "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
            "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
            "                                                     ",
            "            ✨ Welcome to your coding space ✨        ",
            "                                                     ",
        }

        -- Menu buttons
        dashboard.section.buttons.val = {
            dashboard.button("f", "🔍  Find file", ":Telescope find_files <CR>"),
            dashboard.button("e", "📄  New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("p", "📂  Find project", ":Telescope projects <CR>"),
            dashboard.button("r", "🕒  Recently used files", ":Telescope oldfiles <CR>"),
            dashboard.button("t", "📝  Find text", ":Telescope live_grep <CR>"),
            dashboard.button("c", "⚙️  Configuration", ":e $MYVIMRC <CR>"),
            dashboard.button("s", "💾  Restore Session", ":SessionRestore <CR>"),
            dashboard.button("l", "🔌  Lazy", ":Lazy<CR>"),
            dashboard.button("q", "🚪  Quit Neovim", ":qa<CR>"),
        }

        -- Footer with quotes and info
        local function footer()
            local datetime = os.date("  %d-%m-%Y   %H:%M:%S")
            local plugins_text = ""
            -- Get plugin count if lazy.nvim is available
            local lazy_ok, lazy = pcall(require, "lazy")
            if lazy_ok then
                local stats = lazy.stats()
                plugins_text = "📦 " .. stats.loaded .. "/" .. stats.count .. " plugins loaded"
            end
            local quotes = {
                "📃 Code is poetry written in logic",
                "💩 Dream it, code it and make shit happens",
                "⭐ Beautiful code is a code that works",
                "🎯 Focus on progress, not perfection",
            }
            local quote = quotes[math.random(#quotes)]
            return {
                "",
                quote,
                "",
                plugins_text,
                datetime,
                "",
                "Happy coding! 💻",
            }
        end

        dashboard.section.footer.val = footer()

        -- Color customization
        dashboard.section.header.opts.hl = "AlphaHeader"
        dashboard.section.buttons.opts.hl = "AlphaButtons"
        dashboard.section.footer.opts.hl = "AlphaFooter"

        -- Layout configuration
        dashboard.config.layout = {
            { type = "padding", val = 2 },
            dashboard.section.header,
            { type = "padding", val = 2 },
            dashboard.section.buttons,
            { type = "padding", val = 1 },
            dashboard.section.footer,
        }

        -- Disable folding on alpha buffer
        dashboard.config.opts.noautocmd = true

        -- Setup alpha
        alpha.setup(dashboard.config)

        -- Custom highlight groups
        vim.api.nvim_create_autocmd("User", {
            pattern = "AlphaReady",
            callback = function()
                -- Custom colors for the dashboard
                vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#89CFF0", bold = true }) -- Light blue
                vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#98FB98" })           -- Pale green
                vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#DDA0DD", italic = true }) -- Plum

                -- Hide statusline and tabline
                vim.opt.laststatus = 0
                vim.opt.showtabline = 0
            end,
        })

        -- Restore statusline when leaving alpha
        vim.api.nvim_create_autocmd("BufUnload", {
            buffer = 0,
            callback = function()
                vim.opt.laststatus = 3
                vim.opt.showtabline = 2
            end,
        })

        -- Auto-open alpha when no files are specified
        vim.api.nvim_create_autocmd("User", {
            pattern = "BDeletePost*",
            callback = function(event)
                local fallback_name = vim.api.nvim_buf_get_name(event.buf)
                local fallback_ft = vim.api.nvim_buf_get_option(event.buf, "filetype")
                local fallback_on_empty = fallback_name == "" and fallback_ft == ""

                if fallback_on_empty then
                    vim.cmd("Alpha")
                end
            end,
        })
    end
}
