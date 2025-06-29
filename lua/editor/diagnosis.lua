return {
    "folke/trouble.nvim",
    lazy = true,
    keys = {
        { "<leader>xx", "<CMD>Trouble diagnostics toggle<CR>", desc = "Toggle Diagnostics" }
    },
    opts = {
        auto_close = true,
        auto_preview = true,
        auto_fold = true,
        auto_jump = { "lsp_definitions" },
        use_diagnostic_signs = true,
        win = {
            border = "rounded",
        },
        modes = {
            diagnostics = { auto_open = true },
        }
    },
}
