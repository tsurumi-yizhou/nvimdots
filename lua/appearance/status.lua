local filters = { "neo-tree", "alpha" }

return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "DaikyXendo/nvim-material-icon"
    },
    opts = {
        options = {
            icons_enabled = true,
            disabled_filetypes = {
                statusline = filters,
                winbar = filters
            },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { { "filename", path = 1 } },
            lualine_c = {},
            lualine_x = {},
            lualine_y = { "progress" },
            lualine_z = { "location" }
        },
    }
}
