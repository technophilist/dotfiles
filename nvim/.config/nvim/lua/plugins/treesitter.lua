return {
	-- for generating AST: used for highlighting and indenting
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter")
		config.setup({
			-- ensure parsers for detected language is auto-installed
			auto_install = false,
			ensure_installed = {
				"typescript",
				"tsx",
				"javascript",
				"lua",
				"python",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
