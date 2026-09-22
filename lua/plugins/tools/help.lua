return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            delay = 400,
            preset = "modern",
            win = {
                border = "rounded",
            },
            icons = {
                mappings = false,
            },
            spec = {
                { "<leader>c", group = "Code Navigation" },
                { "<leader>d", group = "Diagnostics" },
                { "<leader>T", group = "Tests" },
                { "<leader>w", group = "Windows" },
                { "<leader>r", group = "HTTP Requests" },
            },
        }
    }
}
