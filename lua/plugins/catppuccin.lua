--
-- For testing color contrast:
--   https://snook.ca/technical/colour_contrast/colour.html
--

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
                        --
                        -- Original values from upstream catppuccin
                        --

                        -- rosewater = "#dc8a78",
                        -- flamingo = "#dd7878",
                        -- pink = "#ea76cb",
                        -- mauve = "#8839ef",
                        -- red = "#d20f39",
                        -- maroon = "#e64553",
                        -- peach = "#fe640b",
                        -- yellow = "#df8e1d",
                        -- green = "#40a02b",
                        -- teal = "#179299",
                        -- sky = "#04a5e5",
                        -- sapphire = "#209fb5",
                        -- blue = "#1e66f5",
                        -- lavender = "#7287fd",
                        -- text = "#4c4f69",
                        -- subtext1 = "#5c5f77",
                        -- subtext0 = "#6c6f85",
                        -- overlay2 = "#7c7f93",
                        -- overlay1 = "#8c8fa1",
                        -- overlay0 = "#9ca0b0",
                        -- surface2 = "#acb0be",
                        -- surface1 = "#bcc0cc",
                        -- surface0 = "#ccd0da",
                        -- base = "#eff1f5",
                        -- mantle = "#e6e9ef",
                        -- crust = "#dce0e8",

                        --
                        -- My modifications
                        --

                        base = "#dddddd",
                        mantle = "#d0d0d0",
                        crust = "#000000",
                        overlay0 = "#777777",
                        surface1 = "#888888",
                        text = "#000000",
                        red = "#ff0000",
                        green = "#006000",
                        blue = "#0000ff",
                        sky = "#0445e5",
                        teal = "#107070",
                        -- peach = "#d19a66",
                        yellow = "#af5e1d",
                        mauve = "#6839df",
                        lavender = "#5267cd",
                        sapphire = "#106080",
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
