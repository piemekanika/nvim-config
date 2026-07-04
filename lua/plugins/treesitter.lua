return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	branch = "main",
	config = function()
		local treesitter = require("nvim-treesitter")

		-- Ensure Installed
		treesitter.install({
			"lua",
			"go",
			"gowork",
			"gomod",
			"gosum",
			"gotmpl",
			"comment",
			"markdown",
			"markdown_inline",
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
			"caddy",
			"templ",
		})

		-- Highlighting
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "<filetype>" },
			callback = function()
				vim.treesitter.start()
			end,
		})

		-- Indentation
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "templ",
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}

-- return {
-- 	"nvim-treesitter/nvim-treesitter",
-- 	build = ":TSUpdate",
-- 	lazy = false,
-- 	config = function()
-- 		require("nvim-treesitter.configs").setup({
-- 			ensure_installed = {
-- 				"lua",
-- 				"go",
-- 				"gowork",
-- 				"gomod",
-- 				"gosum",
-- 				"gotmpl",
-- 				"comment",
-- 				"markdown",
-- 				"markdown_inline",
-- 				"javascript",
-- 				"typescript",
-- 				"yaml",
-- 				"svelte",
-- 				"proto",
-- 				"graphql",
-- 				"nginx",
-- 				"dockerfile",
-- 				"bash",
-- 				"gitignore",
-- 				"html",
-- 				"css",
-- 				"scss",
-- 			},
--
-- 			modules = {},
--
-- 			-- Automatically install parsers when entering a buffer (optional)
-- 			auto_install = true,
--
-- 			-- List of parsers to ignore installing (or "all")
-- 			ignore_install = {},
--
-- 			-- Install parsers synchronously (only applied to `ensure_installed`)
-- 			sync_install = false,
--
-- 			-- Enable syntax highlighting
-- 			highlight = {
-- 				enable = true,
-- 			},
--
-- 			-- Optional: Enable other Tree-sitter features like indentation or incremental selection
-- 			indent = {
-- 				enable = true,
-- 			},
-- 		})
-- 	end,
-- }
