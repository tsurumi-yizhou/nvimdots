return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-lua/plenary.nvim",
            "nvim-neotest/nvim-nio"
        },
        keys = {
            { "<leader>dc", ":lua require'dap'.continue()<CR>" },
            { "<leader>dp", ":lua require'dap'.pause()<CR>" },
            { "<leader>so", ":lua require'dap'.step_over()<CR>" },
            { "<leader>si", ":lua require'dap'.step_into()<CR>" },
            { "<leader>sx", ":lua require'dap'.step_out()<CR>" },
            { "<leader>v", ":lua require'dap.ui.variables'.scopes()<CR>" }
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after['event_initialized']['dapui'] = dapui.open
            dap.listeners.before['event_terminated']['dapui'] = dapui.close
            dap.listeners.before['event_exited']['dapui'] = dapui.close
        end
    }
}
