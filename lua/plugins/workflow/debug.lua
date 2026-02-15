return {
    {
        "mfussenegger/nvim-dap",
        lazy = true,
        keys = {
            { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
            { "<leader>dc", function() require("dap").continue() end,          desc = "Start/Continue" },
            { "<leader>di", function() require("dap").step_into() end,         desc = "Step Into" },
            { "<leader>do", function() require("dap").step_over() end,         desc = "Step Over" },
            { "<leader>dO", function() require("dap").step_out() end,          desc = "Step Out" },
            { "<leader>dr", function() require("dap").repl.open() end,         desc = "Open REPL" },
            { "<leader>dl", function() require("dap").run_last() end,          desc = "Run Last" },
        }
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "theHamsta/nvim-dap-virtual-text",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/nvim-nio",
        },
        lazy = true,
        keys = {
            { "<leader>rd", function() require("dapui").toggle() end, desc = "Toggle Dap UI" },
        },
        opts = {
            icons = {
                expanded = "",
                collapsed = "",
                circular = "",
            },
            mappings = {
                expand = { "<CR>", "<2-LeftMouse>" },
                open = "o",
                remove = "d",
                edit = "e",
                repl = "r",
                toggle = "t",
                close = "q",
            },
            layouts = {
                {
                    elements = {
                        "scopes",
                        "breakpoints",
                        "stacks",
                        "watches",
                    },
                    size = 40,
                    position = "left",
                },
                {
                    elements = {
                        "repl",
                        "console",
                    },
                    size = 10,
                    position = "bottom",
                },
            },
            floating = {
                max_height = 0.9,
                max_width = 0.9,
                border = "rounded",
                mappings = {
                    close = { "q", "<Esc>" },
                },
            },
            windows = {
                indent = 1,
            },
            render = {
                max_type_length = nil,
            }
        },
        config = function(_, opts)
            local dap, dapui = require("dap"), require("dapui")
            dap.listeners.before.attach.dapui_config = dapui.open
            dap.listeners.before.launch.dapui_config = dapui.open
            dap.listeners.after.attach.dapui_config = dapui.close
            dap.listeners.after.launch.dapui_config = dapui.close
            dapui.setup(opts)
        end
    }
}
