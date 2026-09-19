return {
    "folke/trouble.nvim",
    lazy = true,
    event = "VeryLazy",
    cmd = "Trouble",
    keys = {
        { "<leader>x", "<CMD>Trouble diagnostics toggle<CR>", desc = "Toggle Workspace Diagnostics" },
        { "<leader>db", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Toggle Buffer Diagnostics" },
        { "<leader>df", vim.diagnostic.open_float, desc = "Show Diagnostic Details" },
        { "<leader>dn", function() vim.diagnostic.jump({ count = 1, float = true }) end, desc = "Next Diagnostic" },
        { "<leader>dp", function() vim.diagnostic.jump({ count = -1, float = true }) end, desc = "Previous Diagnostic" },
    },
    opts = {
        auto_close = true,
        auto_preview = true,
        auto_jump = false,
        win = {
            wo = { foldlevel = 0 },
        },
        modes = {
            diagnostics = { auto_open = true },
            lsp_definitions = { auto_jump = true },
        }
    },
}
