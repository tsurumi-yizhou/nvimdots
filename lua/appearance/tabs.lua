return {
    {
        "romgrk/barbar.nvim",
        dependencies = {
            "lewis6991/gitsigns.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        config = function ()
            vim.g.barbar_auto_setup = false
            require("barbar").setup {
                animation = true,
                auto_hide = false,
                tabpages = true,
                clickable = true,
                focus_on_close = 'previous',
                insert_at_end = true,
                insert_at_start = false,
            }
            vim.keymap.set("n", "<TAB>[", "<CMD>BufferPrevious<CR>")
            vim.keymap.set("n", "<TAB>]", "<CMD>BufferNext<CR>")
            vim.keymap.set("n", "<TAB>\\", "<CMD>BufferClose<CR>")
        end
    },
}
