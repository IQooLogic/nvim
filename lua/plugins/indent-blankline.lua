return {
	"lukas-reineke/indent-blankline.nvim",
	event = "BufEnter",
	main = "ibl",
	opts = {},
	config = function()
		require("ibl").setup({
			scope = {
				enabled = false,
				show_start = false,
				show_end = false,
			},
<<<<<<< HEAD
			exclude = {
				filetypes = {
					"lspinfo",
					"packer",
					"checkhealth",
					"help",
					"man",
					"dashboard",
					"",
				},
			},
=======
>>>>>>> 975f601 (go debugger)
		})
	end,
}
