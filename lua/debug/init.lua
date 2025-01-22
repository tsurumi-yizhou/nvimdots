return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-lua/plenary.nvim",
            "nvim-neotest/nvim-nio"
        },
        keys = {
            { "<leader>dc", require("dap").continue },
            { "<leader>dp", require("dap").pause },
            { "<leader>so", require("dap").step_over },
            { "<leader>si", require("dap").step_into },
            { "<leader>sx", require("dap").step_out },
            { "<leader>v", require("dap.ui.variables").scopes }
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after["event_initialized"]["dapui"] = dapui.open
            dap.listeners.before["event_terminated"]["dapui"] = dapui.close
            dap.listeners.before["event_exited"]["dapui"] = dapui.close
        end
    }
}
