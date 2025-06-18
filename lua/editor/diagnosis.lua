return {
    "folke/trouble.nvim",
    keys = {
        { "<leader>xx", "<CMD>Trouble diagnostics toggle<CR>" }
    },
    opts = {
        auto_open = true,
        auto_close = true,
        auto_preview = true,
        auto_fold = true,
        auto_jump = { "lsp_definitions" },
        use_diagnostic_signs = true,
    },
}
