return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter"
    },
    lazy = true,
    keys = {
        { "<leader>rt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run tests" },
    },
}