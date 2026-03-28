return {
    "nvim-lualine/lualine.nvim",
    opts = {
        options = {
            theme = 'Tomorrow'
        },
        sections = {
            lualine_c = { { 'filename', path=1 } }
        }
    }
}
