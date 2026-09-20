return {
    "akinsho/toggleterm.nvim",
    lazy = true,
    keys = {
        { "<leader>t", "<CMD>ToggleTerm<CR>", desc = "Toggle Terminal" }
    },
    opts = {
        size = 20,
        hide_numbers = true,
        autochdir = true,
        direction = "horizontal",
        close_on_exit = true,
        clear_env = false,
        auto_scroll = true,
        on_open = function(term)
            vim.keymap.set("t", "<leader>t", "<CMD>ToggleTerm<CR>", {
                buffer = term.bufnr,
                desc = "Toggle Terminal",
            })
        end,
    },
}
