return {
    {
        'nvim-telescope/telescope.nvim',
        tag = 'v0.2.1',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- optional but recommended
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },

        config = function()
            local builtin = require("telescope.builtin")
            require("telescope").setup({
                defaults = {
                    hidden = true,
                },
                pickers = {
                    find_files = {
                        -- Need to install fd-find package in OS.
                        find_command = {
                            "fdfind",
                            "--no-ignore-vcs",
                            "--type", "file",
                            "--exclude", "tmp",
                            "--exclude", ".git",
                            "--exclude", ".repo",
                        },
                        hidden = true,
                    },
                },
            })
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fw', builtin.grep_string, {
                desc = 'Find word under cursor' })
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require("telescope").setup({
                extenstions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    }
}
