return {
    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "auto",
                background = {
                    light = "latte",
                    dark = "macchiato",
                },
                transparent_background = false,
                term_colors = false,
                color_overrides = {
                    latte = {
                        -- base = "#dddddd",
                    },
                    frappe = {},
                    macchiato = {},
                    mocha = {},
                }
            })
            vim.cmd.colorscheme "catppuccin"
        end
    }
}
