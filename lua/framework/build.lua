return {
    "tsurumi-yizhou/metabuild.nvim",
    dependencies = {
        "neovim/nvim-lspconfig"
    },
    config = function()
        require("metabuild").setup()
        vim.keymap.set("n", "<leader>S", "<CMD>Sync<CR>")
        vim.keymap.set("n", "<leader>B", "<CMD>Build<CR>")
    end
}