return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "DaikyXendo/nvim-material-icon",
        "MunifTanjim/nui.nvim",
    },
    opts = {
        close_if_last_window = true,
        window = {
            width = 40,
        },
        filesystem = {
            filtered_items = {
                visible = true,
            },
        },
    },
    keys = {
        { "<leader>e", "<CMD>Neotree focus<CR>" },
        { "<leader>ve", "<CMD>Neotree toggle<CR>" },
    },
}
