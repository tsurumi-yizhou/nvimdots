return {
    "j-hui/fidget.nvim",
    lazy = true,
    event = "LspAttach",
    opts = {
        notification = {
            window = {
                winblend = 16,
            },
        },
    },
}
