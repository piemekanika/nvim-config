return {
	"windwp/nvim-ts-autotag",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("nvim-ts-autotag").setup({
			-- Default configuration (optional, customize as needed)
			opts = {
				-- Enable autotagging for specific filetypes
				enable_close = true, -- Auto close tags
				enable_rename = true, -- Auto rename paired tags
				enable_close_on_slash = false, -- Auto close on </
			},
			-- Optionally, specify filetypes (defaults to html, xml, etc.)
			filetypes = { "html", "xml", "jsx", "tsx", "vue", "svelte", "php" },
		})
	end,
}
