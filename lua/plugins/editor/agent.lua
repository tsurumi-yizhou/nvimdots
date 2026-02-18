return {
    "carlos-algms/agentic.nvim",
    lazy = true,
    event = "VeryLazy",
    keys = {
        { "<leader>a", function() require("agentic").toggle() end, desc = "Toggle Agentic" },
        { "<leader>cm", function() require("agentic").run_command() end, desc = "Run Agentic Command" },
    },
    opts = {
        provider = "opencode-acp",
        windows = {
            position = "right",
            width = "33%",
            height = "100%",
        },
    },
}
