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
        { "<leader>ro", "<cmd>OverseerToggle<cr>", desc = "Toggle Overseer" },
    }
}
