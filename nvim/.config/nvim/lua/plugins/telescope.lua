return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- Provides faster, native fzf integration for Telescope
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local keybindings = require("keybindings")
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", keybindings.TELESCOPE_FIND_FILES, builtin.find_files, { desc = "Find files" })
		vim.keymap.set("n", keybindings.TELESCOPE_LIVE_GREP, builtin.live_grep, { desc = "Live grep search" })
	end,
}
