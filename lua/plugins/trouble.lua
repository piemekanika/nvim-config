return {
	"folke/trouble.nvim",
	---@type foo.bar
	opts = {
		focus = true,
		pinned = true,
		auto_close = true,
        open_no_results = false,
		win = {
			type = "float",
			border = "rounded",
			size = {
				width = 100,
				height = 30,
			},
		},
		keys = {
			["<cr>"] = "jump_close",
		},
	}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
	keys = {
		{
			"<leader>xa",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>gr",
			"<cmd>Trouble lsp_references toggle<cr>",
			desc = "LSP references (Trouble)",
		},
		{
			"<leader>gq",
			"<cmd>Trouble qflist toggle filter.buf=0<cr>",
			desc = "Quickfix list (Trouble)",
		},
		{
			"<leader>gt",
			"<cmd>Trouble lsp_type_definitions toggle filter.buf=0<cr>",
			desc = "LSP type definitions (Trouble)",
		},
		{
			"<leader>gg",
			"<cmd>Trouble lsp toggle filter.buf=0<cr>",
			desc = "LSP (Trouble)",
		},
		{
			"<leader>gs",
			"<cmd>Trouble symbols toggle filter.buf=0<cr>",
			desc = "Symbols (Trouble)",
		},
		-- {
		-- 	"<leader>cs",
		-- 	"<cmd>Trouble symbols toggle focus=false<cr>",
		-- 	desc = "Symbols (Trouble)",
		-- },
		-- {
		-- 	"<leader>cl",
		-- 	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
		-- 	desc = "LSP Definitions / references / ... (Trouble)",
		-- },
		-- {
		-- 	"<leader>xL",
		-- 	"<cmd>Trouble loclist toggle<cr>",
		-- 	desc = "Location List (Trouble)",
		-- },
		-- {
		-- 	"<leader>xQ",
		-- 	"<cmd>Trouble qflist toggle<cr>",
		-- 	desc = "Quickfix List (Trouble)",
		-- },
	},
}
