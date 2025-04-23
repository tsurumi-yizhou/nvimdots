local bp_label = "DapBreakpoint"
local bp_cond = "DapBreakpointCondition"
vim.fn.sign_define(bp_label, { text = "●", texthl = "Error", linehl = "", numhl = "" })
vim.fn.sign_define(bp_cond, { text = "🔴", texthl = "WarningMsg", linehl = "", numhl = "" })

return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio"
    },
    config = function()
        vim.dap = require("dap")
        vim.dap.listeners.before.attach.dapui_config = require("dapui").open
        vim.dap.listeners.before.launch.dapui_config = require("dapui").open
        vim.dap.listeners.before.event_terminated.dapui_config = require("dapui").close
        vim.dap.listeners.before.event_exited.dapui_config = require("dapui").close
    end,
    keys = {
        { "<leader>db", "<CMD>lua require(\"dap\").toggle_breakpoint()<CR>" },
        { "<leader>dc", "<CMD>lua require(\"dap\").continue()<CR>" },
        { "<leader>do", "<CMD>lua require(\"dap\").step_over()<CR>" },
        { "<leader>di", "<CMD>lua require(\"dap\").step_into()<CR>" },
        { "<leader>dq", "<CMD>lua require(\"dap\").step_out()<CR>" },
        { "<leader>dr", "<CMD>lua require(\"dap\").repl.open()<CR>" },
    }
}
