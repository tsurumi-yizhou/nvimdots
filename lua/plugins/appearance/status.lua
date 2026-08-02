local filters = { "neo-tree", "alpha" }

local function opencode_status()
    if vim.fn.executable("opencode") ~= 1 then
        return ""
    end
    return "oc"
end

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
            lualine_x = { opencode_status },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
    }
}
