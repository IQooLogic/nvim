return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	opts = {
		filesystem = {
			filtered_items = {
				--visible = true,
				--show_hidden_count = true,
				hide_dotfiles = false,
				hide_gitignored = false,
				hide_by_name = {
					-- '.git',
					-- '.DS_Store',
					-- 'thumbs.db',
				},
				never_show = {},
				always_show = { -- remains visible even if other settings would normally hide it
					".gitignore",
				},
			},
		},
	},
	config = function()
		vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal left<CR>", {})
		vim.keymap.set("n", "<C-n>", ":Neotree toggle left<CR>", {})
		vim.keymap.set("n", "<leader>nr", ":Neotree filesystem reveal right<CR>", {})
		vim.keymap.set("n", "<leader>nt", ":Neotree toggle<CR>", {})
	end,
}
