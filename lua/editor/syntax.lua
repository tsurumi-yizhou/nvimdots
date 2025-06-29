return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = true,
    event = "BufReadPost",
    opts = {
        ensure_installed = { "lua", },
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}