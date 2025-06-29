return {
    "folke/noice.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
        "saghen/blink.cmp",
    },
    lazy = true,
    event = "VeryLazy",
    opts = {
        cmdline = {
            enabled = true,
            view = "cmdline_popup",
        },
        popupmenu = {
            enabled = false,
            backend = "nui",
        },
        lsp = {
            progress = {
                enabled = false,
            },
            hover = {
                enabled = false,
            },
            signature = {
                enabled = false,
            },
            message = {
                enabled = false,
            },
        },
    }
}
