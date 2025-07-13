return {
	"nvim-treesitter/nvim-treesitter-textobjects",
    lazy = false,
    init = function ()
        require("nvim-treesitter.configs").setup({})
    end
}
