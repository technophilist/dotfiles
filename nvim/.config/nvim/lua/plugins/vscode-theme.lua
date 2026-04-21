return {
	"Mofiqul/vscode.nvim",
	priority = 1000,
	config = function()
		require("vscode").setup({
			transparent = false,
			italic_comments = true,
		})
		vim.cmd.colorscheme("vscode")
		-- ensures ts doc comments have proper highlighting
		vim.api.nvim_set_hl(0, "typescriptDocComment", { link = "Comment" })
	end,
}
