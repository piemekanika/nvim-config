return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate", -- Automatically update parsers when installing/updating
	config = function()
		require("nvim-treesitter.configs").setup({
			-- Ensure the parsers for Lua, Go, JavaScript, and TypeScript are installed
			ensure_installed = { "lua", "go", "javascript", "typescript" },

			-- Automatically install parsers when entering a buffer (optional)
			auto_install = true,

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
