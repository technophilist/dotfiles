-- Centralized Keybindings Configuration
local M = {}
-- Leader Key
M.LEADER = " "

-- File Explorer (Neo-tree)
M.NEOTREE_TOGGLE = "<leader>1"
M.NEOTREE_BUFFERS = "<leader>b"

-- Code Formatting (Conform)
M.FORMAT_CODE = "<leader>l"

-- LSP (Language Server Protocol)
M.LSP_HOVER = "gh"
M.LSP_DEFINITION = "gd"
M.LSP_IMPLEMENTATION = "gi"
M.LSP_CODE_ACTION = "<leader>ca"
M.LSP_SIGNATURE_HELP = "<leader>p"

-- Code Diagnostics 
-- 1. Show the error message in a floating window (The "E" in the gutter)
M.SHOW_ERROR = "ge"
M.SHOW_ALL_ERRORS = "gea"

-- Git Operations (Gitsigns)
M.GIT_HUNK_PREVIEW = "<leader>ghp"
M.GIT_HUNK_RESET = "<leader>ghr"
M.GIT_HUNK_STAGE = "<leader>ghs"
M.GIT_FILE_DIFF = "<leader>gfd"
M.GIT_BLAME_TOGGLE = "<leader>gb"
M.GIT_STAGE_CURRENT_FILE = "<leader>gs"

-- Fuzzy Finder (Telescope)
M.TELESCOPE_FIND_FILES = "<leader><leader>"
M.TELESCOPE_LIVE_GREP = "<leader>f"

-- Lazy Git
M.OPEN_LAZY_GIT = "<leader>gg"
return M
