return {
    {
        "wakatime/vim-wakatime",
        lazy = true,
        event = "VeryLazy",
    },
    {
        "j-hui/fidget.nvim",
        lazy = true,
        event = "LspAttach",
        opts = {
            notification = {
                window = {
                    winblend = 0,
                },
            },
        },
    }
}
