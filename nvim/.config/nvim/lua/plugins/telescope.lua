return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- Provides faster, native fzf integration for Telescope
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			-- Replace ui-select windows with telescope window
			{ "nvim-telescope/telescope-ui-select.nvim" },
		},
		config = function()
			-- setup telescope-ui-select plugin
			local telescope = require("telescope")
			telescope.setup({
				extensions = {
					["ui-select"] = {
						-- whenever vim.ui.select is triggered, use the
						-- dropdown theme from telescope
						require("telescope.themes").get_dropdown(),
					},
				},
			})
			telescope.load_extension("ui-select")
			-- setup keybindings
			local keybindings = require("keybindings")
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", keybindings.TELESCOPE_FIND_FILES, builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", keybindings.TELESCOPE_LIVE_GREP, builtin.live_grep, { desc = "Live grep search" })
		end,
	},
}
