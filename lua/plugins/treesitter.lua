return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = {
                "bash",
                "c",
                "cmake",
                "cpp",
                "css",
                "diff",
                "dockerfile",
                "dot",
                "git_config",
                "gitignore",
                "gnuplot",
                "html",
                "javascript",
                "json",
                "json5",
                "lua",
                "make",
                "markdown_inline",
                "meson",
                "python",
                "rst",
                "rust",
                "vim",
                "xml",
                "yaml",
            },
            highlight = { enable = true },
            indent = {enable = true },
        })
    end
}
