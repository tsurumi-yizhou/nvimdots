return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "DaikyXendo/nvim-material-icon"
    },
    lazy = true,
    event = { "VeryLazy", "BufReadPre", "BufNewFile" },
    opts = {
        options = {
            icons_enabled = true,
            disabled_filetypes = {
                statusline = { "neo-tree", "alpha" },
                winbar = { "neo-tree", "alpha" },
            },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_c = { { "filename", path = 1 } },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
    }
}
