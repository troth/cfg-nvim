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

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'clangd',
        'lua_ls',
        'pylsp',
        'rust_analyzer',
    }
})
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

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "*" },
    callback = function(args)
        local ft = vim.bo[args.buf].filetype
        local lang = vim.treesitter.language.get_lang(ft)

        if not vim.treesitter.language.add(lang) then
            -- this stupid tracking is here only because
            -- they have added warnings on absent parsers
            local available = vim.g.ts_available
            or require("nvim-treesitter").get_available()
            if not vim.g.ts_available then
                vim.g.ts_available = available
            end
            if vim.tbl_contains(available, lang) then
                require("nvim-treesitter").install(lang)
            end
        end

        if vim.treesitter.language.add(lang) then
            vim.treesitter.start(args.buf, lang)
            -- this is an experimental feature
            -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            -- vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
            -- vim.wo[0][0].foldmethod = "expr"
        end
    end,
})
