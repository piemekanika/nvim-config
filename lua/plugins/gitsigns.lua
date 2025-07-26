return {
	"lewis6991/gitsigns.nvim",
	event = "BufEnter",
	lazy = true,
	init = function()
		require("gitsigns").setup({
			preview_config = {
				border = "rounded",
			},
		})
	end,
}
