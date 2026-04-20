-- ~/.config/nvim/colors/my_catppuccin.lua

-- 1. Reset existing highlights
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end

vim.g.colors_name = "openavr-light"
vim.o.background = "light" -- This replicates your 'latte' preference

-- 2. Your Custom Palette (Directly from your config)
local cp = {
    base     = "#dddddd",
    mantle   = "#d0d0d0",
    crust    = "#000000",
    overlay0 = "#777777",
    surface1 = "#888888",
    text     = "#000000",
    red      = "#ff0000",
    green    = "#006000",
    blue     = "#0000ff",
    sky      = "#0445e5",
    teal     = "#107070",
    yellow   = "#af5e1d",
    mauve    = "#6839df",
    lavender = "#5267cd",
    sapphire = "#106080",
}

-- 3. Helper for setting highlights
local function hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

--------------------------------------------------------------------------------
-- UI HIGHLIGHTS
--------------------------------------------------------------------------------
hl("Normal",       { fg = cp.text, bg = cp.base })
hl("NormalFloat",  { fg = cp.text, bg = cp.mantle })
hl("FloatBorder",  { fg = cp.blue })
hl("CursorLine",   { bg = cp.mantle })
hl("LineNr",       { fg = cp.overlay0 })
hl("CursorLineNr", { fg = cp.blue, bold = true })
hl("Visual",       { bg = cp.surface1 })
hl("Pmenu",        { fg = cp.text, bg = cp.mantle })
hl("StatusLine",   { fg = cp.text, bg = cp.mantle })
hl("VertSplit",    { fg = cp.crust })

--------------------------------------------------------------------------------
-- SYNTAX HIGHLIGHTS (Standard)
--------------------------------------------------------------------------------
hl("Comment",      { fg = cp.overlay0, italic = true })
hl("Constant",     { fg = cp.yellow })
hl("String",       { fg = cp.green })
hl("Character",    { fg = cp.teal })
hl("Identifier",   { fg = cp.red })
hl("Function",     { fg = cp.blue })
hl("Statement",    { fg = cp.mauve })
hl("Operator",     { fg = cp.sky })
hl("Keyword",      { fg = cp.mauve })
hl("PreProc",      { fg = cp.lavender })
hl("Type",         { fg = cp.yellow })
hl("Special",      { fg = cp.sapphire })
hl("Underlined",   { underline = true })
hl("Error",        { fg = cp.red, bold = true })
hl("Todo",         { fg = cp.base, bg = cp.yellow, bold = true })

--------------------------------------------------------------------------------
-- TREESITTER (For Neovim 0.12.1)
--------------------------------------------------------------------------------
hl("@variable",           { fg = cp.text })
hl("@punctuation",        { fg = cp.overlay0 })
hl("@keyword",            { fg = cp.mauve, bold = true })
hl("@function",           { fg = cp.blue })
hl("@function.builtin",   { fg = cp.sky })
hl("@string",             { fg = cp.green })
hl("@constant",           { fg = cp.yellow })
hl("@property",           { fg = cp.teal })
hl("@type",               { fg = cp.yellow })
hl("@parameter",          { fg = cp.red, italic = true })
hl("@comment",            { link = "Comment" })
hl("@constructor",        { fg = cp.sapphire })

--------------------------------------------------------------------------------
-- NEO-TREE HIGHLIGHTS
--------------------------------------------------------------------------------
-- Main background and text
hl("NeoTreeNormal", { fg = cp.text, bg = cp.mantle })
hl("NeoTreeNormalNC", { fg = cp.text, bg = cp.mantle })

-- Floating windows (if you use them)
hl("NeoTreeFloatNormal", { fg = cp.text, bg = cp.mantle })
hl("NeoTreeFloatBorder", { fg = cp.blue })

-- Folder and File appearance
hl("NeoTreeDirectoryName", { fg = cp.blue })
hl("NeoTreeDirectoryIcon", { fg = cp.blue })
hl("NeoTreeFileName", { fg = cp.text })
hl("NeoTreeFileIcon", { fg = cp.text })

-- Selection/Cursor
hl("NeoTreeCursorLine", { bg = cp.surface1 })

-- Git Status indicators
hl("NeoTreeGitAdded", { fg = cp.green })
hl("NeoTreeGitConflict", { fg = cp.red })
hl("NeoTreeGitDeleted", { fg = cp.red })
hl("NeoTreeGitIgnored", { fg = cp.overlay0 })
hl("NeoTreeGitModified", { fg = cp.yellow })
hl("NeoTreeGitUntracked", { fg = cp.mauve })

-- Misc UI
hl("NeoTreeIndentMarker", { fg = cp.surface1 })
hl("NeoTreeSymbolicLinkTarget", { fg = cp.teal })
hl("NeoTreeRootName", { fg = cp.magenta, bold = true })

hl('TrailingWhitespace', { bg='LightRed' })

vim.api.nvim_create_autocmd('BufWinEnter', {
    callback = function()
        if vim.bo.filetype ~= 'neo-tree'
        then
            -- Match trailing whitespace
            -- vim.fn.matchadd('TrailingWhitespace', [[\s\+$]], 0, -1, {conceal = ''})
            vim.fn.matchadd('TrailingWhitespace', [[\s\+$]])
        end
    end
})
