vim.opt.filetype = "on"
vim.opt.syntax = "enable"

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
