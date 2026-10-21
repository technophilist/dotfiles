return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local keybindings = require("keybindings")
		local gitsigns = require("gitsigns")
		-- hunk operations
		vim.keymap.set("n", keybindings.GIT_HUNK_PREVIEW, gitsigns.preview_hunk, { desc = "Preview git hunk" })
		vim.keymap.set("n", keybindings.GIT_HUNK_RESET, gitsigns.reset_hunk, { desc = "Reset git hunk" })
		vim.keymap.set("n", keybindings.GIT_HUNK_STAGE, gitsigns.stage_hunk, { desc = "Stage git hunk" })
		-- entire file diff
		vim.keymap.set("n", keybindings.GIT_FILE_DIFF, gitsigns.diffthis, { desc = "Show file diff" })
		-- blame
		vim.keymap.set("n", keybindings.GIT_BLAME_TOGGLE, ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle git blame" })
		-- inline diff of changes vs last commit: word-level + line background + deleted lines
		vim.keymap.set("n", keybindings.GIT_INLINE_DIFF_TOGGLE, function()
			local enabled = gitsigns.toggle_word_diff()
			gitsigns.toggle_linehl(enabled)
			gitsigns.toggle_deleted(enabled)
		end, { desc = "Toggle inline diff (added/modified/deleted vs HEAD)" })
	end,

}
