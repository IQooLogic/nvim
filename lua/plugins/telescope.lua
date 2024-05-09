return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")

			local buffers = function()
				builtin.buffers({
					ignore_current_buffer = true,
					sort_mru = true,
				})
			end

			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "fuzzy search file names" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "fuzzy search in files" })
			vim.keymap.set(
				"n",
				"<leader>fb",
				buffers,
				{ silent = true, desc = "fuzzy search open buffers" }
			)
			vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "fuzzy search opened files" })
			vim.keymap.set("n", "<leader>fgg", builtin.git_files, { desc = "fuzzy search git files" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "help tags" })
			vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "lsp references/usages" })
			vim.keymap.set("n", "<leader>fi", builtin.lsp_implementations, { desc = "lsp implementations" })
			vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, { desc = "lsp definitions" })
			vim.keymap.set("n", "<leader>ft", builtin.lsp_type_definitions, { desc = "lsp type definitions" })
			vim.keymap.set("n", "<leader>fe", builtin.diagnostics, { desc = "diagnostics/errors" })
			vim.keymap.set("n", "<leader>fx", builtin.quickfix, { desc = "quickfix" })
			vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "fuzzy search keymaps" })
			vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "fuzzy search commands" })

			require("telescope").setup({
				defaults = { file_ignore_patterns = { ".git/", "vendor/", ".idea/", ".git\\", "vendor\\", ".idea\\" } },
			})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			-- To get ui-select loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require("telescope").load_extension("ui-select")
		end,
	},
}
