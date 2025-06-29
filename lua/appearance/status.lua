local filters = { "neo-tree", "alpha" }

return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "DaikyXendo/nvim-material-icon"
    },
    lazy = true,
    event = "BufReadPre",
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
            lualine_c = { { "filename", path = 1 } },
            lualine_x = { "overseer" },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
    }
}
