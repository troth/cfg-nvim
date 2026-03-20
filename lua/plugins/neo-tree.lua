return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            default_component_configs = {
                file_size = {
                    enabled = false,
                },
                type = {
                    enabled = false,
                },
                last_modified = {
                    enabled = false,
                },
                created = {
                    enabled = false,
                },
            },
            filesystem = {
                filtered_items = {
                    visisble = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                }
            },
        })
        vim.keymap.set('n', '<C-n>', ':Neotree filesystem toggle reveal float<CR>', {})
    end
}
