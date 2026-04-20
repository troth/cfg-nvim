-- General configuration options
vim.opt.compatible = false
vim.opt.confirm = true

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
vim.opt.autoindent = true

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Display
vim.opt.number = true
vim.opt.cc = "80"
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.opt.cursorline = true

-- Undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Colors
vim.opt.termguicolors = true
vim.opt.background = "light"
vim.cmd("highlight Search guibg=lightyellow guifg=darkred")
vim.cmd("highlight ColorColumn guibg=lightgrey")
vim.cmd("highlight Normal guibg=#dddddd")
