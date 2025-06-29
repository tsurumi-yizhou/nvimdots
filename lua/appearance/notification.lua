return {
    "rcarriga/nvim-notify",
    lazy = true,
    event = "VeryLazy",
    opts = {
        background_colour = "#1e1e2e",
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
    }
}
