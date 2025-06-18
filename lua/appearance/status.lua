local filters = { "neo-tree", "alpha" }
local current_build_target = function()
    if vim.build.current then
        return vim.build.current
    else
        return ""
    end
end

return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "DaikyXendo/nvim-material-icon"
    },
    lazy = true,
    event = "User IceLoad",
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
            lualine_b = { { current_build_target } },
            lualine_c = { { "filename", path = 1 } },
            lualine_x = { "overseer" },
            lualine_y = { "progress" },
            lualine_z = { "location" }
        },
    }
}
