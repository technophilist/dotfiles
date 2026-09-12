local keybindings = require("keybindings")
return {
	"stevearc/oil.nvim",
	opts = {
    -- prevent opening oil.nvim automatically when opening nvim in a directory
		default_file_explorer = false,
		-- Configure Oil options here
		view_options = {
			-- Show files and directories that start with a dot
			show_hidden = true,
		},
	},
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
	keys = {
		{ keybindings.OIL_BUFFER, "<cmd>Oil<CR>", desc = "Open parent directory in OIL buffer" },
	},
}
