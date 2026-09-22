return {
    {
        "mfussenegger/nvim-dap",
        keys = {
            { "<F5>",      function() require("dap").continue() end,          desc = "Debug: Continue" },
            { "<F10>",     function() require("dap").step_over() end,         desc = "Debug: Step Over" },
            { "<F11>",     function() require("dap").step_into() end,         desc = "Debug: Step Into" },
            { "<S-F11>",   function() require("dap").step_out() end,          desc = "Debug: Step Out" },
            { "<leader>B", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            local project = require("project")

            -- project.nvim 的 dap provider：解析 .nvim/project.json 的 dap 段并注册。
            local function provider(model)
                local dap_model = model.dap or {}

                local resolved = {}
                for name, def in pairs(dap_model.adapters or {}) do
                    local d = vim.deepcopy(def)
                    if project.executable(d) then
                        resolved[name] = d
                    end
                end
                for alias, target in pairs(dap_model.aliases or {}) do
                    if not resolved[alias] and resolved[target] then
                        resolved[alias] = resolved[target]
                    end
                end
                for name, def in pairs(resolved) do
                    dap.adapters[name] = def
                end
                for ft, cfgs in pairs(dap_model.configurations or {}) do
                    dap.configurations[ft] = vim.list_extend(dap.configurations[ft] or {}, cfgs)
                end
            end
            require("project").register("dap", provider)

            dap.listeners.before.attach.dapui_config = dapui.open
            dap.listeners.before.launch.dapui_config = dapui.open
            dap.listeners.before.event_terminated.dapui_config = dapui.close
            dap.listeners.before.event_exited.dapui_config = dapui.close
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        lazy = true,
        dependencies = { "nvim-neotest/nvim-nio" },
        config = function()
            require("dapui").setup()
        end,
    },
}
