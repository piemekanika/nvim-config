return {
	"lewis6991/gitsigns.nvim",
	event = "BufEnter",
	lazy = true,
	on_attach = function()
		require("gitsigns").setup()

		local gitsigns = require("gitsigns")

		map("n", "<leader>gb", function()
			gitsigns.blame_line({ full = true })
		end)
	end,
}
