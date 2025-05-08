vim.g.mapleader = " "          -- Map leader to <space>
vim.g.maplocalleader = " "     -- Map leader to <space>
vim.opt.autoindent = true      -- take indent for new line from previous line
vim.opt.tabstop = 4            -- Tab indentation levels every two columns
vim.opt.softtabstop = 4        -- Tab indentation when mixing tabs & spaces
vim.opt.shiftwidth = 4         -- Indent/outdent by two columns
vim.opt.expandtab = true       -- Convert all tabs that are typed into spaces
vim.opt.number = true          -- show absolute line no. at the cursor pos
vim.opt.relativenumber = true  -- otherwise, show relative numbers in the ruler
vim.opt.encoding = "utf-8"     -- encoding used internally
vim.opt.fileencoding = "utf-8" -- file encoding for multibyte text
vim.opt.cursorline = true      -- Show a line where the current cursor is
vim.opt.showmatch = true       -- briefly jump to matching bracket if insert one
-- vim.opt.spell = true           -- enable spell check
vim.opt.termguicolors = true   -- enable 24bit colors
vim.opt.foldenable = true      -- enable folding
-- vim.opt.foldlevelstart = 10    -- open most folds by default
-- vim.opt.foldnestmax = 10       -- # nested fold max
vim.opt.foldmethod = "indent"  -- fold based on indent level
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.opt.breakindent = true     -- start wrapped lines indented
vim.opt.linebreak = true       -- do not break words on line wrap
vim.opt.scrolloff = 7          -- min number of lines to keep between cursor and screen edge
vim.opt.sidescrolloff = 5      -- min number of cols to keep between cursor and screen edge
vim.opt.splitbelow = true      -- ':new' ':split' below current
vim.opt.splitright = true      -- ':vnew' ':vsplit' right of current
vim.opt.wrap = true            -- line wrapping
vim.opt.signcolumn = "yes"     -- always show sign column, needed for gitsigns.nvim
vim.o.background = "dark"
vim.opt.compatible = false
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.winborder = 'rounded'

vim.keymap.set("n", "<leader>w", ":write<CR>", { desc = "save file" })
vim.keymap.set("n", "<leader>q", ":quit<CR>", { desc = "quit/close" })
vim.keymap.set("n", "<leader>qq", ":q!<CR>", { desc = "quit without saving" })

vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>", { desc = "clear search highlights" }) -- clears search highlighting

if vim.fn.has("gui_running") then -- if qt then set font
  -- vim.cmd("set guifont=JetBrainsMono\\ NFM:h10")
  vim.opt.guifont = "JetBrains Mono:h14"
end

-- Highlight yanked text for a moment
vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 200 }
  end,
  group = "YankHighlight",
})

-- Custom command to obfuscate line from cursor
_G.runObfuscator = function ()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    local row = cursor_pos[1] - 1
    local col = cursor_pos[2]

    local current_line = vim.api.nvim_get_current_line()

    local text_to_obfuscate = string.sub(current_line, col + 1)

    local output = vim.fn.system('echo ' .. vim.fn.shellescape(text_to_obfuscate))

    output = output:gsub("\n$", "")

    local text_before_cursor = string.sub(current_line, 1, col)
    local new_line = text_before_cursor .. output

    vim.api.nvim_set_current_line(new_line)
    vim.api.nvim_win_set_cursor(0, {row + 1, #text_before_cursor + #output})
end

vim.api.nvim_create_user_command(
    "Obfuscate",
    function ()
        _G.runObfuscator()
    end,
    {
        desc = 'Obfuscate current line from cursor'
    }
)

vim.api.nvim_set_keymap('n', '<leader>o', ':Obfuscate<CR>', {noremap = true, silent = true, desc = 'Replace surrent line from cursor'})

-- local password = "my_password"
