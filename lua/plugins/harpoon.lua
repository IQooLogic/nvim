return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = true,
	event = "VimEnter",
	config = function()
		local harpoon = require("harpoon")
		local ext = require("harpoon.extensions")
		harpoon:extend(ext.builtins.navigate_with_number())

		---@diagnostic disable-next-line: missing-parameter
		harpoon:setup()
		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():append()
		end)
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)
		vim.keymap.set("n", "<C-h>", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<C-t>", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<A-l>", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<C-s>", function()
			harpoon:list():select(4)
		end)

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<C-S-P>", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<C-S-N>", function()
			harpoon:list():next()
		end)
	end,
}
