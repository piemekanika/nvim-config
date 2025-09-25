return {
	-- Mason for managing LSP servers
	{
		"williamboman/mason.nvim",
		version = "1.11.0",
		config = function()
			require("mason").setup()
		end,
	},

	-- Mason-LSPconfig bridge
	{
		"williamboman/mason-lspconfig.nvim",
		version = "1.32.0",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				-- TODO move it to local var
				ensure_installed = { "vtsls", "lua_ls" }, -- Add any LSP servers you want auto-installed
			})
		end,
	},

	-- LSP Config
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mason-org/mason.nvim", version = "1.11.0" },
			{ "mason-org/mason-lspconfig.nvim", version = "1.32.0" },
		},
		config = function()
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			vim.lsp.enable({ "vtsls", "lua_ls" })

			-- Optional: Keymaps for LSP
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				end,
			})
		end,
	},
}

-- old lsp config
-- -- Basic LSP setup example for Lua
-- local lspconfig = vim.lsp.config
-- lspconfig.lua_ls.setup({
-- 	settings = {
-- 		Lua = {
-- 			diagnostics = {
-- 				globals = { "vim" }, -- Recognize Vim globals
-- 			},
-- 		},
-- 	},
-- })

-- lspconfig.ts_ls.setup({
-- 	on_attach = function(client, bufnr)
-- 		local opts = { buffer = bufnr, remap = false }
-- 		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
-- 		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
-- 		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
-- 		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
-- 	end,
-- 	filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
-- })

-- lspconfig.vtsls.setup({
-- 	on_attach = function(client, bufnr)
-- 		local opts = { buffer = bufnr, remap = false }
-- 		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
-- 		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
-- 		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
-- 		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
-- 	end,
-- 	filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
-- })
--
