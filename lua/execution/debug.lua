local bp_label = "DapBreakpoint"
local bp_cond = "DapBreakpointCondition"
vim.fn.sign_define(bp_label, { text = "●", texthl = "Error", linehl = "", numhl = "" })
vim.fn.sign_define(bp_cond, { text = "🔴", texthl = "WarningMsg", linehl = "", numhl = "" })

function toggle()
    require("dap").toggle_breakpoint()
end

function continue()
    require("dap").continue()
end

function step_over()
    require("dap").step_over()
end

function step_into()
    require("dap").step_into()
end

function step_out()
    require("dap").step_out()
end

return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio"
    },
    keys = {
        { "<leader>db", toggle },
        { "<leader>dc", continue },
        { "<leader>do", step_over },
        { "<leader>di", step_into },
        { "<leader>dq", step_out },
    },
    config = function()
        vim.dap = require("dap")
        vim.dap.listeners.before.attach.dapui_config = require("dapui").open
        vim.dap.listeners.before.launch.dapui_config = require("dapui").open
        vim.dap.listeners.before.event_terminated.dapui_config = require("dapui").close
        vim.dap.listeners.before.event_exited.dapui_config = require("dapui").close
    end,
}
