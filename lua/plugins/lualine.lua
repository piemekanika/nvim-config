local function parent_dir_and_filename()
	local filename = vim.fn.expand("%:t")
	if filename == "" then
		return "[No Name]"
	end

	local parent_dir = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":h:t")
	if parent_dir == "." then
		parent_dir = "current"
	end

	-- Get filetype icon using devicons if available
	local icon = ""
	local has_devicons, devicons = pcall(require, "nvim-web-devicons")
	if has_devicons then
		-- local filetype = vim.bo.filetype
		local extension = vim.fn.fnamemodify(filename, ":e")
		local file_icon = devicons.get_icon(filename, extension, { default = true })
		if file_icon then
			icon = file_icon .. " "
		end
	end

	return parent_dir .. " / " .. icon .. filename
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	init = function()
		require("lualine").setup({
			sections = {
				lualine_a = { "mode" },
				lualine_b = {},
				lualine_c = { parent_dir_and_filename },
				lualine_x = { "filetype" },
				lualine_y = { "branch", "diff", "diagnostics" },
				lualine_z = { "location" },
			},
			options = {
				theme = "dracula",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
                -- globalstatus = true,
			},
		})
	end,
}
