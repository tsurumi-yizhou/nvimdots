return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
        dependencies = {
            "tsurumi-yizhou/nvim-lspconfig"
        },
    },
}
