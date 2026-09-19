return {
    "stevearc/aerial.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "DaikyXendo/nvim-material-icon",
    },
    lazy = true,
    cmd = { "AerialToggle", "AerialOpen", "AerialClose" },
    keys = {
        { "<leader>o", "<CMD>AerialToggle<CR>", desc = "Toggle Outline" },
    },
    opts = {
        backends = {
            "treesitter", "lsp",
        },
        layout = {
            width = 40,
            default_direction = "prefer_right",
        },
        lazy_load = true,
        autojump = true,
        nerd_font = true,
    },
}
