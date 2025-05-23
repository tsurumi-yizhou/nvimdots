return {
    {
        "akinsho/bufferline.nvim",
        dependencies = {
            "DaikyXendo/nvim-material-icon"
        },
        lazy = false,
        priotity = 999,
        keys = {
            { "<TAB>[", "<CMD>BufferLineCyclePrev<CR>" },
            { "<TAB>]", "<CMD>BufferLineCycleNext<CR>" },
        },
        opts = {
            options = {
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "File Explorer",
                        highlight = "Directory",
                        text_align = "left",
                        separator = true,
                    },
                },
            }
        },
    },
    {
        "famiu/bufdelete.nvim",
        lazy = true,
        keys = {
            { "<TAB>\\", "<CMD>Bdelete<CR>" }
        },
    }
}
