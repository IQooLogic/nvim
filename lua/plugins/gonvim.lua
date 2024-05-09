return {
    "ray-x/go.nvim",
    dependencies = {
        "ray-x/guihua.lua",
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
        require("go").setup()

        local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.go",
            callback = function()
                require("go.format").goimport()
            end,
            group = format_sync_grp,
        })

        vim.keymap.set("n", "<leader>ft", require("go.format").goimport, { desc = "go format file" })
		vim.keymap.set("n", "<C-r>", ':vnew | .! go run #<CR>', { desc = "go run vertical buffer output" }) -- run current file and show output in vertical buffer
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod", "gowork", "gosum", "goimpl" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
