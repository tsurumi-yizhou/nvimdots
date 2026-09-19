return {
    "kdheepak/lazygit.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    lazy = true,
    keys = {
        { "<leader>g", "<CMD>LazyGit<CR>", desc = "Toggle LazyGit" }
    },
}