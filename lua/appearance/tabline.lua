return {
    {
        "akinsho/bufferline.nvim",
        lazy = false,
        dependencies = {
            "DaikyXendo/nvim-material-icon"
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
        keys = {
            { "<TAB>[", "<CMD>BufferLineCyclePrev<CR>" },
            { "<TAB>]", "<CMD>BufferLineCycleNext<CR>" },
        }
    },
    {
        "famiu/bufdelete.nvim",
        keys = {
            { "<TAB>\\", "<CMD>Bdelete<CR>" }
        }
    }
}
