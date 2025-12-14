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
	},
	keys = {
		-- Add any custom keybindings here if needed
	},
}
