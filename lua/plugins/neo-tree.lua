return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    lazy = false,
    keys = {
        -- vim.keymap.set('n', '<C-n>', ':Neotree filesystem toggle reveal float<CR>', {})
        { '<C-n>', ':Neotree filesystem toggle reveal float<CR>' },
    },
    opts = {
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
    },
}
