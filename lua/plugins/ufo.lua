return {
	"kevinhwang91/nvim-ufo",
	event = "BufEnter",
	dependencies = {
		"kevinhwang91/promise-async",
		{
			"luukvbaal/statuscol.nvim",
			config = function()
				local builtin = require("statuscol.builtin")
				require("statuscol").setup({
					relculright = true,
					segments = {
						{ text = { builtin.foldfunc },      click = "v:lua.ScFa" },
						{ text = { "%s" },                  click = "v:lua.ScSa" },
						{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
					},
				})
			end,
		},
	},
	config = function()
		--- @diagnostic disable: unused-local
		require("ufo").setup({
			provider_selector = function(_bufnr, _filetype, _buftype)
				return { "treesitter", "indent" }
			end,
		})

		vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "open all folds" })
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "close all folds" })
	end,
}
