return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "DaikyXendo/nvim-material-icon"
    },
    opts = {
        options = {
            icons_enabled = true,
            disabled_filetypes = {
                statusline = {
                    "neo-tree", "alpha"
                }
            }
        }
    }
}
