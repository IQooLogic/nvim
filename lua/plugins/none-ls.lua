return {
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.gofmt,
					null_ls.builtins.formatting.goimports,
					null_ls.builtins.formatting.golines,
					null_ls.builtins.formatting.google_java_format,
				},
			})
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = { "stylua", "gofmt", "goimports", "golines", "google-java-format" },
			})
		end,
	},
}
