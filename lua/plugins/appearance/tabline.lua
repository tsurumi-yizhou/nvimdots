return {
    {
        "akinsho/bufferline.nvim",
        dependencies = {
            "DaikyXendo/nvim-material-icon"
        },
        event = "VeryLazy",
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
        keys = {
            { "<Tab>\\", "<CMD>Bdelete<CR>", desc = "Delete Buffer" }
        },
    }
}
