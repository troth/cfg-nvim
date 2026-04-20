require('neo-tree').setup({
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

vim.keymap.set('n', '<leader>nl', ':Neotree filesystem toggle reveal left<CR>', {})
vim.keymap.set('n', '<C-n>', ':Neotree filesystem toggle reveal float<CR>', {})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "neo-tree",
  callback = function()
    -- Disable listchars (which show trailing spaces as characters)
    vim.opt_local.list = false
  end,
})
