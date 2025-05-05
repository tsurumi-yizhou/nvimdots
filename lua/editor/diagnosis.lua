return {
    "folke/trouble.nvim",
    keys = {
        { "<leader>xx", "<CMD>Trouble diagnostics toggle<CR>" }
    },
    opts = {
        auto_open = false,
        auto_close = true,
        auto_preview = true,
        auto_fold = false,
        auto_jump = { "lsp_definitions" },
        use_diagnostic_signs = true,
    },
}
