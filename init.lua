vim.keymap.set("n", ";", ":", { noremap = true })

vim.opt.number = true -- Enable line numbers
vim.opt.relativenumber = true -- Make line numbers relative

vim.opt.cursorline = true
vim.opt.cursorlineopt = "number" -- Only highlight the line number
vim.api.nvim_set_hl(0, "CursorLineNr", { bold = true, fg = "#ffaf00" })

-- Set clipboard to use system clipboard
vim.opt.clipboard = "unnamedplus"

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

vim.keymap.set("n", "-", function()
	require("oil").open_float()
end, { desc = "Open Oil file explorer in float window" })

require("config.lazy")

vim.diagnostic.config({
	signs = false, -- Enables signs in the sign column
})

-- Open quickfix at bottom of all windows
vim.keymap.set("n", "<leader>q", ":botright copen<CR>", { noremap = true })

-- Close Quickfix
vim.keymap.set("n", "<leader>Q", ":cclose<CR>", { noremap = true })

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Telescope resume" })
vim.keymap.set("n", "<leader>fl", builtin.lsp_references, { desc = "Telescope LSP references" })
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Telescope LSP symbols" })
vim.keymap.set("n", "<leader>ft", builtin.treesitter, { desc = "Telescope treesitter" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Telescope diagnostics" })
vim.keymap.set("n", "<leader>fe", builtin.current_buffer_fuzzy_find, { desc = "Telescope current buffer fuzzy finder" })

vim.api.nvim_set_keymap("n", "<leader>w", ":bd<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<A-d>", ':lua require("FTerm").toggle()<CR>')
vim.keymap.set("t", "<A-d>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

vim.keymap.set({ "v", "x" }, "<leader>gh", ":DiffviewFileHistory<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<leader>gf", "<CMD>DiffviewFileHistor %<CR>", { noremap = true, silent = true })

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
	require("tiny-code-action").code_action()
end, { noremap = true, silent = true })

require("snippets.test")
require("custom.ar")
require("snippets.tsx")

vim.o.foldcolumn = "0" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
