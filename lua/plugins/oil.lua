return {
	"stevearc/oil.nvim",

	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		view_options = {
			show_hidden = true,
		},

        keymaps = {
            ["q"] = { "actions.close", mode = "n" },
        },

		-- Configuration for the floating window in oil.open_float
		---@type oil.fooBar
		float = {
			-- Padding around the floating window
			padding = 2,
			-- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
			max_width = 100,
			max_height = 0.5,
			border = "rounded",
			win_options = {
				winblend = 0,
			},
			-- optionally override the oil buffers window title with custom function: fun(winid: integer): string
			get_win_title = function()
				-- return vim.fn.expand("%")
				local dir = require("oil").get_current_dir()
				if dir then
					-- Get the current working directory
					local cwd = vim.fn.getcwd()
					-- Compute the relative path from the cwd to the current oil directory
					local relative_path = vim.fn.fnamemodify(dir, ":." .. cwd)
					if relative_path == "" then
						return "./" -- Handle case where dir is the same as cwd
					end
					return relative_path
				end
				return "Oil" -- Fallback if no directory is available
			end,
			-- preview_split: Split direction: "auto", "left", "right", "above", "below".
			preview_split = "auto",
			-- This is the config that will be passed to nvim_open_win.
			-- Change values here to customize the layout
			override = function(conf)
				return conf
			end,
		},
	},

	-- Optional dependencies
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons

	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,

	-- workaround for colorscheme not to break when oil opens a file
	init = function()
		vim.cmd("colorscheme catppuccin-macchiato")
	end,
}
