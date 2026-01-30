vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function ()
        vim.schedule(function ()
            local tasks = vim.g.tasks or {}
            require("overseer.template").register {
                name = "Project Tasks",
                generator = function (_, callback)
                    local results = {}
                    for name, config in pairs(tasks) do
                        table.insert(results, {
                            name = name,
                            builder = type(config) == "function" and config or function ()
                                return config
                            end,
                        })
                    end
                    callback(results)
                end
            }
        end)
    end
})


return {
    "stevearc/overseer.nvim",
    lazy = true,
    opts = {
        strategy = "toggleterm",
        templates = { "builtin" },
        task_list = {
            direction = "bottom",
            bindings = {
                ["?"] = "ShowHelp",
                ["q"] = "Close",
                ["<CR>"] = "RunAction"
            }
        },
        component_aliases = {
            default = {
                "on_output_quickfix",
                "on_exit_set_status",
                "on_complete_notify",
                "on_complete_dispose"
            }
        },
        status_colors = true
    },
    keys = {
        { "<leader>rc", "<cmd>OverseerRun<cr>", desc = "Run Overseer Task" },
    }
}
