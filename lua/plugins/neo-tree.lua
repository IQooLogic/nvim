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
				visible = true, -- when true, they will just be displayed differently than normal items
				show_hidden_count = false,
				hide_dotfiles = true,
				hide_gitignored = true,
				hide_hidden = true, -- only works on Windows for hidden files/directories
				hide_by_name = {
					--"node_modules"
				},
				hide_by_pattern = { -- uses glob style patterns
					--"*.meta",
					--"*/src/*/tsconfig.json",
				},
				always_show = { -- remains visible even if other settings would normally hide it
					".gitignored",
				},
				never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
					--".DS_Store",
					--"thumbs.db"
				},
				never_show_by_pattern = { -- uses glob style patterns
					--".null-ls_*",
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
