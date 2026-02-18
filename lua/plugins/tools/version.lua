return {
    {
        "kdheepak/lazygit.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        lazy = true,
        keys = {
            { "<leader>lg", "<CMD>LazyGit<CR>", desc = "Toggle LazyGit" }
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        lazy = true,
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            current_line_blame = false,
        },
    },
}