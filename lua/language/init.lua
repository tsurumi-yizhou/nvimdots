return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
        dependencies = {
            "neovim/nvim-lspconfig"
        },
    },
}
