return {
	-- for generating AST: used for highlighting and indenting
	"nvim-treesitter/nvim-treesitter",
	commit = "45a07f869b0cffba342276f2c77ba7c116d35db8",
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
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
		})
	end,
}
