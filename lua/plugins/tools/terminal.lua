return {
    "akinsho/toggleterm.nvim",
    lazy = true,
    keys = {
        { "<leader>t", "<CMD>ToggleTerm<CR>", desc = "Toggle Terminal" }
    },
    opts = {
        size = 40,
        hide_numbers = true,
        autochdir = true,
        direction = "horizontal",
        close_on_exit = true,
        clear_env = false,
        auto_scroll = true,
        on_open = function(term)
            vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], {
                buffer = term.bufnr,
                desc = "Leave Terminal Input Mode",
            })
        end,
    },
}
