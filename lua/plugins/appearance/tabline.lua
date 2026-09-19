return {
    {
        "akinsho/bufferline.nvim",
        dependencies = {
            "DaikyXendo/nvim-material-icon"
        },
        lazy = true,
        event = { "VeryLazy", "BufReadPre", "BufNewFile" },
        keys = {
            { "<Tab>[", "<CMD>BufferLineCyclePrev<CR>", desc = "Previous Buffer" },
            { "<Tab>]", "<CMD>BufferLineCycleNext<CR>", desc = "Next Buffer" },
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
            { "<Tab>\\", "<CMD>Bdelete<CR>", desc = "Delete Buffer" }
        },
    }
}
