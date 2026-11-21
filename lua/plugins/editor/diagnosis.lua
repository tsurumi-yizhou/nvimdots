return {
    "folke/trouble.nvim",
    event = "VeryLazy",
    cmd = "Trouble",
    keys = {
        -- 自动打开的 diagnostics 视图常驻（auto_open 的视图关闭后不停监听、is_open 恒为真），
        -- 直接 `Trouble diagnostics toggle` 只会关掉它再弹出没人消费的视图，等于失效。
        -- 所以手动切换先 close 常驻视图，再按常规语义 toggle。
        {
            "<leader>x",
            function()
                require("trouble").close({ mode = "diagnostics" })
                vim.cmd("Trouble diagnostics toggle")
            end,
            desc = "Toggle Workspace Diagnostics",
        },
        {
            "<leader>db",
            function()
                require("trouble").close({ mode = "diagnostics" })
                vim.cmd("Trouble diagnostics toggle filter.buf=0")
            end,
            desc = "Toggle Buffer Diagnostics",
        },
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
            -- auto_open 只加在 diagnostics 模式上（全局加会被 trouble 拒绝），
            -- 这样只有诊断面板在出现诊断时自动打开，其它模式仍只在手动触发时打开。
            diagnostics = { auto_open = true },
            lsp_definitions = { auto_jump = true },
        },
    },
}
