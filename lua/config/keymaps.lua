local opts = { noremap = true }

-- Make it easier to jump between splits.
vim.keymap.set('n', '<c-h>', '<c-w>h', opts)
vim.keymap.set('n', '<c-j>', '<c-w>j', opts)
vim.keymap.set('n', '<c-k>', '<c-w>k', opts)
vim.keymap.set('n', '<c-l>', '<c-w>l', opts)

-- Move block selected with <S-v>
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts)
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts)

vim.keymap.set('', '<leader>df', function()
    vim.diagnostic.open_float()
end, {desc = 'Toggle diagnostic float' })

vim.keymap.set('', '<leader>dn', function()
    vim.diagnostic.goto_next()
end, {desc = 'Jump to next diagnostic' })
