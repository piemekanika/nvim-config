return {
	"kevinhwang91/nvim-ufo",

	dependencies = {
		"kevinhwang91/promise-async",
	},

	init = function()
		-- UFO configuration
		require("ufo").setup({
			provider_selector = function()
				return { "treesitter", "indent" }
			end,
		})
	end,
}
