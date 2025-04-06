return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        keys = {
            { "<leader>t", "<CMD>ToggleTerm<CR>" }
        },
        config = function()
            require("toggleterm").setup {
                size = 15,
                hide_numbers = true,
                autochdir = true,
                direction = "horizontal",
                close_on_exit = true,
                clear_env = false,
                auto_scroll = true,
            }
            vim.popup_terminal = function(command, post)
                local win = vim.api.nvim_get_current_win()
                require("toggleterm.terminal").Terminal:new({
                    cmd = command,
                    direction = "float",
                    close_on_exit = true,
                    clear_env = false,
                    auto_scroll = true,
                    on_exit = function ()
                        vim.api.nvim_set_current_win(win)
                        post()
                    end
                }):toggle()
            end
        end
    }
}