return {
    {
        "folke/which-key.nvim",
        lazy = true,
        event = "VeryLazy",
        opts = {
            delay = 800,
            preset = "modern",
            win = {
                border = "rounded",
            },
            icons = {
                mappings = false,
            },
        }
    }
}
