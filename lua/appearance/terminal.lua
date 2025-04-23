function vim.popup_exec(command, post)
    require("toggleterm.terminal").Terminal:new {
        direction = "float",
        cmd = command,
        close_on_exit = false,
        on_exit = function (term, _, code, _)
            if code == 0 then
                if post then post() end
                term:close()
            end
        end
    }:toggle()
end

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
