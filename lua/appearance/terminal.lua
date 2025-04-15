return {
    {
        "akinsho/toggleterm.nvim",
        keys = {
            { "<leader>t", "<CMD>ToggleTerm<CR>" }
        },
        config = function()
            require("toggleterm").setup {
                size = 12,
                hide_numbers = true,
                autochdir = true,
                direction = "horizontal",
                close_on_exit = true,
                clear_env = false,
                auto_scroll = true,
            }
        end
    }
}