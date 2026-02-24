return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- Enable the notifier
		notifier = { enabled = true },
		-- Enable winsize notifications
		winsize = { enabled = true },
		picker = {
			enabled = true,
			ui_select = true,
			sources = {
				files = {
					-- 'hidden = true' will show dotfiles (.config, etc)
					-- 'ignored = false' (default) ensures .gitignore is respected
					hidden = true,
					ignored = false,
				},
			},
		},
	},
	keys = {
		-- Add any custom keybindings here if needed
	},
}
