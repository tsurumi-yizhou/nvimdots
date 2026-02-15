return {
    "stevearc/aerial.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "DaikyXendo/nvim-material-icon",
    },
    lazy = true,
    keys = {
        { "<leader>vo", "<CMD>AerialToggle<CR>", desc = "Toggle Outline" },
    },
    opts = {
        backends = {
            "treesitter", "lsp",
        },
        layout = {
            width = 40,
            win_opts = {
                border = "rounded",
            },
            default_direction = "prefer_right",
        },
        lazy_load = true,
        autojump = true,
        nerd_font = "mono",
    },
}
