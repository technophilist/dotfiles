local keybindings = require("keybindings")
return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "marilari88/neotest-vitest",
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-vitest"),
            },
        })
    end,
    keys = {
        { keybindings.NEOTEST_RUN_FILE,      function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run file tests" },
        { keybindings.NEOTEST_RUN_NEAREST,   function() require("neotest").run.run() end,                  desc = "Run nearest test" },
        { keybindings.NEOTEST_TOGGLE_SUMMARY, function() require("neotest").summary.toggle() end,          desc = "Toggle summary" },
        { keybindings.NEOTEST_SHOW_OUTPUT,   function() require("neotest").output.open() end,              desc = "Show output" },
    },
}
