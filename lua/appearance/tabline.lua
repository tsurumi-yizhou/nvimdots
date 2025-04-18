return {
    "akinsho/bufferline.nvim",
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
    }
}
