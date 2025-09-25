return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"go",
				"gowork",
				"gomod",
				"gosum",
				"gotmpl",
				"comment",
				"javascript",
				"typescript",
				"yaml",
				"svelte",
				"proto",
				"graphql",
				"nginx",
				"dockerfile",
				"bash",
				"gitignore",
				"html",
				"css",
				"scss",
			},

			modules = {},

			-- Automatically install parsers when entering a buffer (optional)
			auto_install = true,

			-- List of parsers to ignore installing (or "all")
			ignore_install = {},

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Enable syntax highlighting
			highlight = {
				enable = true,
			},

			-- Optional: Enable other Tree-sitter features like indentation or incremental selection
			indent = {
				enable = true,
			},
		})
	end,
}
