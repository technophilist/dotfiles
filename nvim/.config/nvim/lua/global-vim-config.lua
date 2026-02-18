---@diagnostic disable: undefined-global

-- tab key = two spaces
vim.cmd("set tabstop=2")
-- controls how many spaces the Tab key inserts or deletes while editing.
vim.cmd("set softtabstop=2")
-- number of spaces used for auto-indent (can be used by language servers / plugins
vim.cmd("set shiftwidth=2")
-- LuaLine already configured. Disable the default mode line.
vim.opt.showmode = false

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
local keybindings = require("keybindings")
vim.g.mapleader = keybindings.LEADER
vim.g.maplocalleader = "\\"

-- Stage the current file
vim.keymap.set("n", keybindings.GIT_STAGE_CURRENT_FILE, ":!git add %<CR><CR>", { desc = "Git stage current file" })
--
-- keybindings for diagnostics
vim.keymap.set("n", keybindings.SHOW_ERROR, vim.diagnostic.open_float, { desc = "Show diagnostic message" })
vim.keymap.set("n", keybindings.SHOW_ALL_ERRORS, vim.diagnostic.setloclist, { desc = "Show all diagnostic messages" })

-- always have gutter space to show erros, warnings etc. This will prevent the screen
-- from offsetting suddently when there are diagnostic messages.
vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.relativenumber = true
-- always save to system clipboard
vim.opt.clipboard = "unnamedplus"
vim.keymap.set("n", keybindings.YANK_CURRENT_DIRECTORY_OF_FILE, function()
	vim.fn.setreg("+", vim.fn.expand("%:p"))
	print("Full file path copied to clipboard")
end, { desc = "Copy full file path to clipboard" })
