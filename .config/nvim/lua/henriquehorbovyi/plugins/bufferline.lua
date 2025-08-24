-- Minimalist Black & White Bufferline Configuration
return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
        options = {
            mode = "tabs",
            separator_style = "slant",
            themable = true, -- allows highlight groups to be overridden i.e. sets highlights as default
            show_buffer_icons = false, -- disable filetype icons for tabs
       },
    }
}

