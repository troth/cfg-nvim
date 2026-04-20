-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.termguicolors = true
vim.cmd.colorscheme('openavr-light')

require('config.options')
require('config.pack')
require('config.diagnostics')
require('config.keymaps')
