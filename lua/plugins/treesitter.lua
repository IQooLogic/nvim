return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufEnter" },
	config = function()
		local config = require("nvim-treesitter.configs")
		---@diagnostic disable-next-line: missing-fields
		config.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"elixir",
                "heex",
                "eex",
                "zig",
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
