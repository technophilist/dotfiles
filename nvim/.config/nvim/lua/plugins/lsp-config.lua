return {
	{
		-- install and manage lsp's
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		-- mainly to use the ensure_installed option
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				-- ensures these language servers are installed
				ensure_installed = { "lua_ls", "pyright", "ts_ls", "eslint" },
			})
		end,
	},
	{
		-- for connecting lsp to neovim
		"neovim/nvim-lspconfig",
		config = function()
			local keybindings = require("keybindings")
			-- add capabilities to all clients
			-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- vim.lsp.config("*", { capabilities = capabilities })
			--
			-- make neovim to communicate with language servers
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("es-lint")

		vim.keymap.set("n", keybindings.LSP_HOVER, vim.lsp.buf.hover, { desc = "Show hover information" })
		vim.keymap.set("n", keybindings.LSP_DEFINITION, vim.lsp.buf.definition, { desc = "Go to definition" })
		vim.keymap.set("n", keybindings.LSP_IMPLEMENTATION, vim.lsp.buf.implementation, { desc = "Go to implementation" })
		vim.keymap.set("n", keybindings.LSP_CODE_ACTION, vim.lsp.buf.code_action, { desc = "Show code actions" })
			vim.keymap.set("n", keybindings.LSP_SIGNATURE_HELP, vim.lsp.buf.signature_help, { desc = "Show method signature help" })
		end,
	},
}
