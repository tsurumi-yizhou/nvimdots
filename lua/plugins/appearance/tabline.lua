return {
    {
        "akinsho/bufferline.nvim",
        dependencies = {
            "DaikyXendo/nvim-material-icon"
        },
        lazy = true,
        event = "BufReadPre",
        keys = {
            { "<TAB>[", "<CMD>BufferLineCyclePrev<CR>", desc = "Previous Tab" },
            { "<TAB>]", "<CMD>BufferLineCycleNext<CR>", desc = "Next Tab" },
        },
        opts = {
            options = {
                always_show_bufferline = true,
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "File Explorer",
                        highlight = "Directory",
                        text_align = "left",
                        separator = true,
                    },
                },
                color_icons = true,
            }
        },
    },
    {
        "famiu/bufdelete.nvim",
        lazy = true,
        keys = {
            { "<TAB>\\", "<CMD>Bdelete<CR>", desc = "Close Tab" }
        },
    }
}
