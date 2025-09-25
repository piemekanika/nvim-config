return {
	"numToStr/Comment.nvim",
	event = "BufEnter",
	opts = {
		-- add any options here
		---LHS of toggle mappings in NORMAL mode
		toggler = {
			---Line-comment toggle keymap
			line = "<leader>/",
			---Block-comment toggle keymap
			block = "gbc",
		},
		---LHS of operator-pending mappings in NORMAL and VISUAL mode
		-- opleader = {
		---Line-comment keymap
		--	line = "<leader>//",
		---Block-comment keymap
		--	block = "gb",
		--},
	},
}
