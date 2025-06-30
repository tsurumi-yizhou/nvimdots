local path = vim.fs.joinpath(".nvim", "debug.json")
local configs = {}
if vim.fn.filereadable(path) then
    local file = io.open(path, "r")
    ---@diagnostic disable-next-line: need-check-nil
    local content = file:read("a")
    ---@diagnostic disable-next-line: need-check-nil
    file:close()
    local success, json = pcall(vim.json.decode, content)
    if success then
        configs = json
    else
        vim.notify_once("Failed to decode debug.json")
    end
end

return {
    {
        "mfussenegger/nvim-dap",
        lazy = true,
        keys = {
            { "<leader>db", "<CMD>lua require'dap'.toggle_breakpoint()<CR>", desc = "Toggle Breakpoint" },
            { "<leader>dc", "<CMD>lua require'dap'.continue()<CR>",          desc = "Continue" },
            { "<leader>di", "<CMD>lua require'dap'.step_into()<CR>",         desc = "Step Into" },
            { "<leader>do", "<CMD>lua require'dap'.step_over()<CR>",         desc = "Step Over" },
            { "<leader>dO", "<CMD>lua require'dap'.step_out()<CR>",          desc = "Step Out" },
            { "<leader>dr", "<CMD>lua require'dap'.repl.open()<CR>",         desc = "Open REPL" },
            { "<leader>dl", "<CMD>lua require'dap'.run_last()<CR>",          desc = "Run Last" },
        },
        config = function()
            require("dap").adapters = configs.adapters or {}
            require("dap").configurations = configs.configurations or {}
            local success, overseer = pcall(require, "overseer")
            if success then
                overseer.enable_dap()
            end
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
            "theHamsta/nvim-dap-virtual-text",
        },
        lazy = true,
        keys = {
            { "<leader>dx", "<CMD>lua require'dapui'.open()<CR>", desc = "Open DAP UI" },
        },
        opts = {
            icons = { expanded = "▾", collapsed = "▸" },
            mappings = {
                expand = { "<CR>", "<2-LeftMouse>" },
                open = "o",
                remove = "d",
                edit = "e",
                repl = "r",
                toggle = "t",
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
                    position = "right",
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
                max_height = nil,
                max_width = nil,
                border = "rounded",
                mappings = {
                    close = { "q", "<ESC>" },
                },
            },
            windows = { indent = 1 },
            render = {
                max_type_length = nil,
            }
        },
        config = function(_, opts)
            local dap, dapui = require("dap"), require("dapui")
            dap.listeners.before.attach.dapui_config = dapui.open
            dap.listeners.before.launch.dapui_config = dapui.open
            dap.listeners.after.event_initialized.dapui_config = dapui.open
            dap.listeners.before.event_terminated.dapui_config = dapui.close
            dap.listeners.before.event_exited.dapui_config = dapui.close
            dapui.setup(opts)
        end
    }
}
