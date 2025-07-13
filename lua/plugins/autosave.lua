return {
	"Pocco81/auto-save.nvim",
	event = "InsertEnter",
	opts = {},

	init = function()
		require("auto-save").setup({})
	end,
}
