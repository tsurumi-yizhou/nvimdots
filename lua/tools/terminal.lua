return {
    "akinsho/toggleterm.nvim",
    lazy = true,
    keys = {
        { "<leader>t", "<CMD>ToggleTerm<CR>", desc = "Toggle To Terminal" }
    },
    opts = {
        hide_numbers = true,
        autochdir = true,
        direction = "horizontal",
        close_on_exit = true,
        clear_env = false,
        auto_scroll = true,
    },
}
