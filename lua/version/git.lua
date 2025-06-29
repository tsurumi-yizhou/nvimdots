return {
    "kdheepak/lazygit.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    lazy = true,
    keys = {
        { "<leader>lg", "<CMD>LazyGit<CR>", desc = "Toggle Git" }
    },
}