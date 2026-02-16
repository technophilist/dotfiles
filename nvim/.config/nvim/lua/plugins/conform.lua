return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local keybindings = require("keybindings")
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				python = { "black" },
				lua = { "stylua" },
			},
			async = true,
			lsp_fallback = true,
		})
		vim.keymap.set("n", keybindings.FORMAT_CODE, conform.format, { desc = "format code with conform.nvim" })
	end,
}
