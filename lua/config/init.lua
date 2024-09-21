-- General configuration options
vim.opt.compatible = false

-- Mouse Support
vim.opt.mouse = "v"
vim.opt.mouse = "a"

-- All copy/paste from clipboard and with middle mouse selection.
-- NOTE: Need to `apt install xsel wl-clipboard`
vim.opt.clipboard ="unnamed"

-- Tabs
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

-- Indenting
vim.opt.smartindent = true

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Display
vim.opt.number = true
vim.opt.cc = "80"
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8

-- Undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Colors
vim.opt.termguicolors = true
vim.opt.background = "light"
vim.cmd("highlight Search ctermbg=lightyellow ctermfg=darkred")
vim.cmd("highlight ColorColumn ctermbg=lightgrey guibg=lightgrey")

-- Highlight trailing white space
vim.cmd("highlight WhiteSpaceEOL ctermbg=darkgreen guibg=lightgreen")
vim.cmd("match WhiteSpaceEOL /\\s\\+$/")
vim.cmd("autocmd WinEnter * match WhiteSpaceEOL /\\s\\+$/")

local opts = { noremap = true }

-- Make it easier to jump between splits.
vim.keymap.set('n', '<c-h>', '<c-w>h', opts)
vim.keymap.set('n', '<c-j>', '<c-w>j', opts)
vim.keymap.set('n', '<c-k>', '<c-w>k', opts)
vim.keymap.set('n', '<c-l>', '<c-w>l', opts)

-- Move block selected with <S-v>
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts)
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts)
