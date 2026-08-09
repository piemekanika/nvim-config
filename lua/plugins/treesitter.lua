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

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "svelte",
			callback = function()
				vim.treesitter.start()
			end,
		})

        vim.api.nvim_create_autocmd("FileType", {
			pattern = "c",
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
