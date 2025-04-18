return {
    "akinsho/toggleterm.nvim",
    opts = {
        size = 12,
        hide_numbers = true,
        autochdir = true,
        direction = "horizontal",
        close_on_exit = true,
        clear_env = false,
        auto_scroll = true,
    },
    keys = {
        { "<leader>t", "<CMD>ToggleTerm<CR>" }
    },
}

