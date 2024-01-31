vim.g.mapleader = " "          -- Map leader to <space>
vim.g.maplocalleader = " "     -- Map leader to <space>
vim.opt.autoindent = true      -- take indent for new line from previous line
vim.opt.tabstop = 4            -- Tab indentation levels every two columns
vim.opt.softtabstop = 4        -- Tab indentation when mixing tabs & spaces
vim.opt.shiftwidth = 4         -- Indent/outdent by two columns
vim.opt.expandtab = false      -- Convert all tabs that are typed into spaces
vim.opt.number = true          -- show absolute line no. at the cursor pos
vim.opt.relativenumber = false -- otherwise, show relative numbers in the ruler
vim.opt.encoding = "utf-8"     -- encoding used internally
vim.opt.fileencoding = "utf-8" -- file encoding for multibyte text
vim.opt.cursorline = true      -- Show a line where the current cursor is
vim.opt.showmatch = true       -- briefly jump to matching bracket if insert one
vim.opt.spell = true           -- enable spell check
vim.opt.termguicolors = true   -- enable 24bit colors
vim.opt.foldenable = true      -- enable folding
vim.opt.foldlevelstart = 10    -- open most folds by default
vim.opt.foldnestmax = 10       -- # nested fold max
vim.opt.foldmethod = "indent"  -- fold based on indent level
vim.opt.breakindent = true     -- start wrapped lines indented
vim.opt.linebreak = true       -- do not break words on line wrap
vim.opt.scrolloff = 7          -- min number of lines to keep between cursor and screen edge
vim.opt.sidescrolloff = 5      -- min number of cols to keep between cursor and screen edge
vim.opt.splitbelow = true      -- ':new' ':split' below current
vim.opt.splitright = true      -- ':vnew' ':vsplit' right of current
vim.opt.wrap = true            -- line wrapping
vim.opt.signcolumn = "yes"     -- always show sign column, needed for gitsigns.nvim

vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")
vim.keymap.set("n", "<leader>qq", ":q!<CR>")

vim.keymap.set("n", "<A-c>", ":noh<CR>") -- clears search highlighting
