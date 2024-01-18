return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = {
                "c",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "elixir",
                "javascript",
                "html",
                "go",
                "java",
                "rust",
                "css",
            },
            auto_install = true,
            sync_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
