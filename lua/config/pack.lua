local gh = function(x) return 'https://github.com/' .. x end
-- local cb = function(x) return 'https://codeberg.org/' .. x end

vim.pack.add({
    { src = gh('neovim/nvim-lspconfig') },
    { src = gh('mason-org/mason.nvim') },
    { src = gh('mason-org/mason-lspconfig.nvim') },
    {
        src = gh('nvim-neo-tree/neo-tree.nvim'),
        version = vim.version.range('3')
    },
    -- Neotree dependencies
    { src = gh('nvim-lua/plenary.nvim') },
    { src = gh('MunifTanjim/nui.nvim') },
    { src = gh('nvim-tree/nvim-web-devicons') },
})

require('pkgs.lsp')
require('pkgs.neo-tree')
