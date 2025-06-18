return {
    "stevearc/aerial.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "DaikyXendo/nvim-material-icon",
    },
    keys = {
        { "<leader>vo", "<CMD>AerialToggle<CR>", desc = "Toggle Outline" },
    },
    opts = {
        width = 50,
        resize_to_content = true
    },
}
