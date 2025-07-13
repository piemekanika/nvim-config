return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "BufEnter",

	opts = {
		options = {
			indicator = {
				style = "none",
			},
			close_icon = "",
			modified_icon = "",
			max_name_length = 25,
		},
	},

	init = function()
		vim.opt.termguicolors = true

		vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
		vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })

		require("bufferline").setup({
			options = {
				indicator = {
					style = "none",
				},
				close_icon = " ",
                buffer_close_icon = " ",
				modified_icon = " ",
				max_name_length = 25,
			},
		})
	end,
}
