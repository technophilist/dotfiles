return {
	"mawkler/modicator.nvim",
	dependencies = { "Mofiqul/vscode.nvim" },
	init = function()
		vim.o.cursorline = true
		vim.o.number = true
		vim.o.termguicolors = true
	end,
	opts = {},
}
