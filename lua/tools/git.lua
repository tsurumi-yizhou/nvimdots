return {
    "kdheepak/lazygit.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    cmd = "LazyGit",
    keys = {
        { "<leader>lg", "<CMD>LazyGit<CR>" }
    },
    config = function ()
        require("lazygit").setup()
    end
}