return {
	"sindrets/diffview.nvim",

	cmd = {
		"DiffviewOpen",
		"DiffviewClose",
		"DiffviewFileHistory",
		"DiffviewToggleFiles",
		"DiffviewFocusFiles",
	},

	config = function()
		require("diffview").setup({
			keymaps = {
				view = {
					["q"] = "<Cmd>DiffviewClose<CR>",
				},
				file_panel = {
					["q"] = "<Cmd>DiffviewClose<CR>",
				},
				file_history_panel = {
					["q"] = "<Cmd>DiffviewClose<CR>",
				},
			},
		})
	end,
}
