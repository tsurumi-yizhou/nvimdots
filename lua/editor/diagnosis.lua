return {
    "folke/trouble.nvim",
    config = function()
        require("trouble").setup {
            auto_open = false,
            auto_close = true,
            auto_preview = true,
            auto_fold = false,
            auto_jump = { "lsp_definitions" },
            use_diagnostic_signs = true,
        }
        vim.keymap.set("n", "<leader>xx", "<CMD>Trouble diagnostics toggle<CR>")
    end
}
