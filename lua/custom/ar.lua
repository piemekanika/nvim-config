-- Define the command to run your script with the current file path and word under cursor
vim.api.nvim_create_user_command("RunMyScript", function()
	-- Get the current file path
	local file_path = vim.fn.expand("%:p")

	-- Get the word under cursor
	local word_under_cursor = vim.fn.expand("<cword>")

	-- Define the path to your script in the Neovim config folder
	local script_path = "node " .. vim.fn.stdpath("config") .. "/code_mods/ts/add-to-return.js"

	-- Construct the command
	local cmd = script_path .. " " .. vim.fn.shellescape(file_path) .. " " .. vim.fn.shellescape(word_under_cursor)

	-- Execute the command
	vim.fn.system(cmd)

	-- Optional: Show a message that the command was executed
	-- vim.notify(
	--        "Script executed with file: " .. file_path .. " and word: " .. word_under_cursor,
	--        vim.log.levels.INFO
	--    )

	vim.notify(cmd, vim.log.levels.INFO)

    vim.cmd('edit!')
end, {})

-- Map the command to <leader>ar
vim.keymap.set("n", "<leader>ar", ":RunMyScript<CR>", { noremap = true, silent = true })
