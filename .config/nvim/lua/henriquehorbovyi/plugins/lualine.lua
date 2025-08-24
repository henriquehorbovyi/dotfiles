-- Minimalist Black & White Lualine Configuration
return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        -- Minimalist black & white colors
        local colors = {
            black = '#000000',
            dark_gray = '#1a1a1a',
            gray = '#404040',
            light_gray = '#808080',
            white = '#ffffff',
            off_white = '#f5f5f5',
            red = '#ff5555',
            yellow = '#f1fa8c',
            blue = '#8be9fd',
            teal = '#50fa7b',
        }

        -- Simple monochrome theme
        local minimal_theme = {
            normal = {
                a = { fg = colors.black, bg = colors.white, gui = 'bold' },
                b = { fg = colors.white, bg = colors.gray },
                c = { fg = colors.light_gray, bg = colors.dark_gray },
            },
            insert = {
                a = { fg = colors.white, bg = colors.black, gui = 'bold' },
                b = { fg = colors.white, bg = colors.gray },
            },
            visual = {
                a = { fg = colors.black, bg = colors.light_gray, gui = 'bold' },
                b = { fg = colors.white, bg = colors.gray },
            },
            replace = {
                a = { fg = colors.white, bg = colors.gray, gui = 'bold' },
                b = { fg = colors.white, bg = colors.gray },
            },
            command = {
                a = { fg = colors.black, bg = colors.off_white, gui = 'bold' },
                b = { fg = colors.white, bg = colors.gray },
            },
            inactive = {
                a = { fg = colors.light_gray, bg = colors.dark_gray },
                b = { fg = colors.light_gray, bg = colors.dark_gray },
                c = { fg = colors.light_gray, bg = colors.dark_gray },
            },
        }
        
        local lazy_status = require("lazy.status")

        require('lualine').setup({
            options = {
                theme = minimal_theme,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {
                    statusline = { 'alpha', 'dashboard', 'NvimTree' },
                },
                globalstatus = true,
            },
            sections = {
                -- Left: Just mode
                lualine_a = {
                    {
                        'mode',
                        fmt = function(str)
                            local modes = {
                                ['NORMAL'] = 'N',
                                ['INSERT'] = 'I',
                                ['VISUAL'] = 'V',
                                ['V-LINE'] = 'VL',
                                ['V-BLOCK'] = 'VB',
                                ['REPLACE'] = 'R',
                                ['COMMAND'] = 'C',
                                ['TERMINAL'] = 'T',
                            }
                            return modes[str] or str:sub(1, 1)
                        end,
                    }
                },
                -- Left-center: Git branch
                lualine_b = {
                    {
                        'branch',
                        icon = '🌿',
                    },
                },
                -- Center: Empty (clean look)
                lualine_c = {},
                -- Right-center: Lazy updates, encoding, fileformat, filetype, diagnostics
                lualine_x = {
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        color = { fg = "#ff9e64" },
                    },
                    {
                        'diagnostics',
                        sources = { 'nvim_lsp' },
                                              symbols = { error = '❌', warn = '⚠️', info = '💡', hint = '💭' },

                        diagnostics_color = {
                            error = { fg = colors.red },
                            warn = { fg = colors.yellow },
                            info = { fg = colors.blue },
                            hint = { fg = colors.teal },
                        },
                    },
                },
                -- Right: Programming language
                lualine_y = {
                    {
                        'filetype',
                        colored = false,
                        icon_only = false,
                    },
                },
                -- Far right: Line and column
                lualine_z = {
                    {
                        'location',
                    }
                }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { 'location' }
            },
        })
    end,
}
