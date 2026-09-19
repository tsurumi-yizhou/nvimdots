return {
    {
        "folke/which-key.nvim",
        lazy = true,
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
                { "<leader>w", group = "Windows" },
                { "<leader>r", group = "HTTP Requests" },
            },
        }
    }
}
