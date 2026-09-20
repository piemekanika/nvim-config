vim.keymap.set("n", ";", ":", { noremap = true })

vim.loader.enable()

vim.filetype.add({
    extension = {
        templ = "templ",
    },
})

vim.opt.number = true -- Enable line numbers
vim.opt.relativenumber = true -- Make line numbers relative

vim.opt.cursorline = true
vim.opt.cursorlineopt = "number" -- Only highlight the line number
vim.api.nvim_set_hl(0, "CursorLineNr", { bold = true, fg = "#ffaf00" })

-- Set clipboard to use system clipboard
vim.opt.clipboard = "unnamedplus"

-- always add a signcolumn on the left to prevent layout shift of git signs
vim.opt.signcolumn = "yes"

-- reloads file when the file is changed outside of neovim
vim.o.autoread = true

-- Set indents
-- Use tabs for indentation
vim.opt.expandtab = false
-- Set the width of a tab character to 4 spaces
vim.opt.tabstop = 4
-- Set the number of spaces for indentation commands like >> or <<
vim.opt.shiftwidth = 4
-- Set the number of spaces inserted when you press Tab in insert mode
vim.opt.softtabstop = 4

vim.opt.scrolloff = 8 -- Keep 8 lines above and below the cursor

-- Set indentation to 4 spaces
vim.opt.tabstop = 4 -- Width of tab character
vim.opt.softtabstop = 4 -- Fine tunes the amount of whitespace to be added
vim.opt.shiftwidth = 4 -- Width of indentation
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.smartindent = true -- Insert indents automatically

-- Optional but recommended indentation settings
vim.opt.autoindent = true -- Copy indent from current line when starting a new line
vim.opt.breakindent = true -- Wrapped lines preserve indentation

require("config.lazy")

vim.diagnostic.config({
	signs = false, -- Enables signs in the sign column
})

-- Open quickfix at bottom of all windows
vim.keymap.set("n", "<leader>q", ":botright copen<CR>", { noremap = true })

-- Close Quickfix
vim.keymap.set("n", "<leader>Q", ":cclose<CR>", { noremap = true })

local snacks_picker = require("snacks").picker
vim.keymap.set("n", "<leader>ff", snacks_picker.files, { desc = "Snacks find files" })
vim.keymap.set("n", "<leader>fw", snacks_picker.grep, { desc = "Snacks live grep" })
vim.keymap.set("n", "<leader>fb", snacks_picker.buffers, { desc = "Snacks buffers" })
vim.keymap.set("n", "<leader>fr", snacks_picker.resume, { desc = "Snacks resume" })
vim.keymap.set("n", "<leader>fl", snacks_picker.lsp_references, { desc = "Snacks LSP references" })
vim.keymap.set("n", "<leader>fs", snacks_picker.lsp_symbols, { desc = "Snacks LSP symbols" })
vim.keymap.set("n", "<leader>ft", snacks_picker.treesitter, { desc = "Snacks treesitter" })
vim.keymap.set("n", "<leader>fd", snacks_picker.diagnostics, { desc = "Snacks diagnostics" })

vim.api.nvim_set_keymap("n", "<leader>w", ":bd<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<A-d>", ':lua require("FTerm").toggle()<CR>')
vim.keymap.set("t", "<A-d>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

vim.keymap.set({ "v", "x" }, "<leader>gh", ":DiffviewFileHistory<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<leader>gf", "<CMD>DiffviewFileHistor %<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<Esc>", ":noh<CR><Esc>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>gb", function()
	require("gitsigns").blame_line()
end, { desc = "Git blame current line" })

-- Make help pages appear on the right split
vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	callback = function()
		vim.cmd("wincmd L")
	end,
})

vim.keymap.set("n", "<leader>ga", function()
	require("tiny-code-action").code_action({})
end, { noremap = true, silent = true })

-- require("snippets.test")
-- require("custom.ar")
-- require("snippets.tsx")

vim.o.foldcolumn = "0" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.keymap.set("n", "-", function()
	require("oil").open_float()
end, { desc = "Open Oil file explorer in float window" })

vim.lsp.inlay_hint.enable(false)

-- Copy the current file path relative to the project root (cwd)
vim.keymap.set("n", "<leader>yf", function()
	local path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.")
	vim.fn.setreg("+", path)
	vim.notify("Copied: " .. path)
end, { desc = "Copy file path from project root" })

-- Copy the entire file's content
vim.keymap.set("n", "<leader>ya", function()
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	vim.fn.setreg("+", table.concat(lines, "\n") .. "\n")
	vim.notify("Copied file content")
end, { desc = "Copy entire file content" })

-- Select the entire file's content
vim.keymap.set("n", "<leader>va", "ggVG", { desc = "Select entire file content" })

-- Yank to 'block hole register' when c key is used
-- so clipboard won't be polluted
vim.keymap.set("n", "c", '"_c', { remap = false })
vim.keymap.set("x", "c", '"_c', { remap = false })

-- Normal mode: move the current line
vim.keymap.set("n", "<leader>j", ":move .+1<CR>==", { silent = true })
vim.keymap.set("n", "<leader>k", ":move .-2<CR>==", { silent = true })
vim.keymap.set("n", "<M-j>", ":move .+1<CR>==", { silent = true })
vim.keymap.set("n", "<M-k>", ":move .-2<CR>==", { silent = true })

-- Visual mode: move selected lines
vim.keymap.set("x", "<leader>j", ":move '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("x", "<leader>k", ":move '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("x", "<M-j>", ":move '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("x", "<M-k>", ":move '<-2<CR>gv=gv", { silent = true })

local opts = { noremap = true, silent = true }

-- Normal mode: move the current line
vim.keymap.set("n", "<leader>h", "<<", opts)
vim.keymap.set("n", "<leader>l", ">>", opts)
vim.keymap.set("n", "<M-h>", "<<", opts) -- Alt-h
vim.keymap.set("n", "<M-l>", ">>", opts) -- Alt-l

-- Visual mode: move selected lines and keep them selected
vim.keymap.set("x", "<leader>h", "<gv", opts)
vim.keymap.set("x", "<leader>l", ">gv", opts)
vim.keymap.set("x", "<M-h>", "<gv", opts) -- Alt-h
vim.keymap.set("x", "<M-l>", ">gv", opts) -- Alt-l
