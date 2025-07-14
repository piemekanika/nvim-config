return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	lazy = false,
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	init = function()
		require("nvim-treesitter.configs").setup({
			text_objects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@conditional.outer",
						["ic"] = "@conditional.inner",
						["ab"] = "@block.outer",
						["ib"] = "@block.inner",
						["ar"] = "@return.outer",
						["ir"] = "@return.inner",
					},
				},
			},
		})
	end,
}

