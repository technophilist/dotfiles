return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, but recommended
	},
	lazy = false, -- neo-tree will lazily load itself
	config = function()
		local keybindings = require("keybindings")
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = false,
					never_show = {
						".DS_Store"
					}
				},
			},
			window = {
				position = "right",
			},
		})
		vim.keymap.set(
			"n",
			keybindings.NEOTREE_TOGGLE,
			":Neotree filesystem toggle reveal right<CR>",
			{ desc = "Toggle Neo-tree file explorer" }
		)
		vim.keymap.set(
			"n",
			keybindings.NEOTREE_BUFFERS,
			":Neotree buffers<CR>",
			{ desc = "Toggle Neo-tree current active buffers explorer" }
		)
	end,
}
