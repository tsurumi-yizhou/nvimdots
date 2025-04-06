return {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "theHamsta/nvim-dap-virtual-text",
            "nvim-neotest/nvim-nio",
        },
        keys = {
            { "<leader>b", "<CMD>lua require(\"dap\").breakpoint()<CR>" },
            { "<leader>c", "<CMD>lua require(\"dap\").continue()<CR>" },
        },
        config = function()
            require("nvim-dap-virtual-text").setup {
                commented = true
            }
            local dap, dapui = require("dap"), require("dapui")
            dapui.setup {
                expand_lines = true
            }
            dap.listeners.after.event_initialized["dapui_config"] = dapui.open
            dap.listeners.before.event_terminated["dapui_config"] = dapui.close
            dap.listeners.before.event_exited["dapui_config"] = dapui.close
        end
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "mfussenegger/nvim-dap",
            "williamboman/mason.nvim"
        },
        config = function()
            require("mason-nvim-dap").setup()
        end
    },
}
