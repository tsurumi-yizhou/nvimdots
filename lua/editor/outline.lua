return {
    "stevearc/aerial.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("aerial").setup {
            on_attach = function(bufnr)
                vim.keymap.set("n", "<leader>vo", "<CMD>AerialToggle<CR>")
            end
        }
    end
}
