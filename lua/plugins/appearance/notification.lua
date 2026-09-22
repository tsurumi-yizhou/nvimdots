return {
    "rcarriga/nvim-notify",
    lazy = false,
    priority = 100,
    opts = {
        background_colour = "#181825",
        fps = 60,
        max_width = 80,
        max_height = 30,
        stages = "fade_in_slide_out",
        timeout = 3000,
        top_down = true,
        icons = {
            ERROR = "",
            WARN = "",
            INFO = "",
            DEBUG = "",
            TRACE = "✎",
        },
    },
    config = function(_, opts)
        require("notify").setup(opts)
        vim.notify = require("notify")
    end,
}
