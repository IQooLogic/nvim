return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup()
		vim.keymap.set("n", "<A-i>", ":ToggleTerm direction=horizontal<CR>", { desc = "toggle term horizontaly" })
		vim.keymap.set("n", "<A-v>", ":ToggleTerm size=60 direction=vertical<CR>", { desc = "toggle term vertically" })
		vim.keymap.set("n", "<A-f>", ":ToggleTerm direction=float<CR>", { desc = "toggle term float" })
		vim.keymap.set("n", "<C-b>", ':TermExec cmd="goreleaser --clean"<CR>', { desc = "run goreleaser --clean" })
		vim.keymap.set("n", "<C-t>", ':TermExec cmd="go run %"<CR>', { desc = "go run current buffer split term" })

		function _G.set_terminal_keymaps()
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { buffer = 0, desc = "" })
			vim.keymap.set("t", "<esc><esc>", "<Cmd>ToggleTerm<CR>", { buffer = 0, desc = "" })
			vim.keymap.set("t", "jk", [[<C-\><C-n>]], { buffer = 0, desc = "" })
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { buffer = 0, desc = "" })
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { buffer = 0, desc = "" })
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { buffer = 0, desc = "" })
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { buffer = 0, desc = "" })
			vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], { buffer = 0, desc = "" })
		end

		-- if you only want these mappings for toggle term use term://*toggleterm#* instead
		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
	end,
}
