local lsp_servers = {
	"vtsls",
	"lua_ls",
	"tailwindcss",
	"svelte",
	"gopls",
	"yamlls",
	"bashls",
	"docker_language_server",
	"nginx_language_server",
	"graphql",
	-- "protols",
	"cssls",
	-- 'gitlab_ci_ls',
	"gh_actions_ls",
}

return {
	-- Mason for managing LSP servers
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	-- Mason-LSPconfig bridge
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = lsp_servers,
			})
		end,
	},

	-- LSP Config
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mason-org/mason.nvim" },
			{ "mason-org/mason-lspconfig.nvim" },
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

			vim.lsp.enable(lsp_servers)

			-- Optional: Keymaps for LSP
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				end,
			})
		end,
	},
}

