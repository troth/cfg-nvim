require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'clangd',
        'lua_ls',
        'pylsp',
        'rust_analyzer',
    }
})

vim.lsp.enable('lua_ls')
