local dashboard_image = {
    [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⣛⡍⠙⢿⣿⠟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⠟⣩⣥⣬⣭⣭⣍⣀⠲⠤⠄⠙⠈⡟⠄⠿⣛⣛⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣫⢀⣬⣍⣓⡚⢛⣛⣛⣛⣛⠛⠿⠿⠷⠄⠀⠀⣬⣶⠿⢛⣫⡉⠄⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠛⡛⣡⣾⠃⣿⣿⣿⣿⣿⣿⣏⣉⡳⠂⢉⣠⡰⢾⡷⠶⠒⠈⢐⠢⣭⡙⠻⣦⣈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢁⠊⣀⠌⢠⣶⣶⣀⣿⣿⢿⣿⣿⠿⠿⠝⠁⠀⢥⣬⣭⣭⣭⣄⡀⠠⠘⢿⡟⠝⢄⣦⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢿⡀⠠⠍⡀⠈⡿⠛⠟⠻⠷⡀⠈⠛⠈⠄⢬⣭⣄⣒⡈⢻⣭⣍⡉⠙⠓⠄⠰⡙⢷⡀⠹⣧⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⡩⠖⣈⡱⠦⠀⠀⠃⢃⠀⠠⠂⠄⡐⡀⣡⠳⣦⡌⢪⣿⣦⣍⠉⣛⡻⢟⠻⢷⣤⠀⠀⠘⡌⠳⡄⢹⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣏⣨⣶⡿⠁⣠⣭⢀⠔⢀⢁⡔⡠⢰⣶⡇⢿⣮⡁⢹⡛⠄⠉⠛⠧⠍⠀⠉⢂⣀⠐⣍⠳⠸⡆⠈⠀⠹⣇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⢃⣿⠀⡜⠘⣴⠇⣿⠏⡿⠀⠹⣿⣏⠻⣦⠘⠗⠀⠀⠀⠐⠀⠙⣧⠈⢳⡄⢻⣀⠹⣠⠹⡸⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⣿⣿⣿⣿⣿⣿⣿⣿⢸⢃⠆⣷⡜⣹⢸⠏⠄⠃⠀⠂⠈⠙⠆⠀⠠⠐⣶⣧⠀⣰⣼⣿⠈⠂⢀⠁⢆⠈⠆⠘⢷⡅⢿⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⣿⣿⣿⣿⣿⣿⣿⣿⠟⡁⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⠈⠎⠂⢿⡇⠹⡌⠀⠸⠈⢀⣩⣀⣈⡙⠦⠹⣖⢨⣿⣿⣿⣿⣿⢐⣀⣌⠠⣄⠂⠻⡘⣷⣌⠈⢿⣿⣿⣿⣿⣿⣿⣿]],
    [[⣿⣿⣿⣿⣿⣿⣿⠇⢸⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠀⠀⠈⠇⠀⢿⠀⠺⣤⣸⣿⣿⣿⣿⡷⣦⣽⣿⣿⣿⣿⣿⠇⠀⣿⡟⠣⡙⣧⡀⠑⠈⢿⣿⣦⡙⢿⣿⣿⣿⣿⣿]],
    [[⣿⣿⣿⣿⣿⣿⣿⡐⠸⣦⡻⠿⣿⣿⣿⡿⠿⢟⠋⠁⠔⣊⣤⠀⠄⣀⠈⠆⠁⠈⢟⢿⣿⣿⣿⣄⣙⣿⠿⣫⣿⣿⠋⠀⠇⠘⢿⣌⠢⣌⡋⢦⡡⠰⣝⢿⣿⣆⢻⣿⣿⣿⣿]],
    [[⣿⣿⣿⣿⡿⠿⠿⠷⠄⠛⠿⣷⣶⣄⣀⡀⠅⠀⢊⠉⡉⠙⣿⣧⠀⡈⠁⡀⠀⢴⡦⠑⠻⢿⣿⣿⣶⣷⣿⣿⡿⡡⠀⠃⠀⠀⠀⠹⢿⣦⡙⠢⠑⣤⡈⢦⡹⣿⠈⣿⣿⣿⣿]],
    [[⣿⡟⢋⡠⠔⣛⣩⣭⣤⡤⠍⠀⠀⠀⣠⣴⡎⠀⠋⠈⠀⠆⡼⠿⠧⣼⡖⡀⠔⠚⠀⣘⡀⠀⠨⢉⠛⠻⠿⠋⠈⠄⠀⠀⣄⣧⠰⣤⡀⠙⠿⣎⡛⠶⢮⣤⣑⡀⠆⣿⣿⣿⣿]],
    [[⡟⣊⣵⣾⡿⢛⣩⠍⠀⠀⠠⠄⠀⠴⣿⣿⣷⡀⠀⢀⣠⠊⠀⠀⠀⠈⢰⣷⡀⢀⠈⠛⠃⡀⠀⠀⡉⠐⠒⠊⠁⡀⠀⣀⡙⢿⡆⣿⣷⠰⣶⣶⡄⠉⠐⢮⣙⠻⣷⣌⠻⣿⣿]],
    [[⣆⣿⣿⠡⡾⢁⡂⠐⠢⠤⠤⠐⠒⠂⠀⠈⠉⠛⠛⠋⠀⠀⠀⠀⠀⠀⢿⠿⠃⠿⣷⣦⣤⣈⠁⢀⡀⢠⠀⣠⣾⠷⠚⢋⣁⣈⡁⢻⣿⠀⣿⣿⣷⡸⣧⠀⠛⠿⣮⡙⢧⡘⣿]],
    [[⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⢀⣤⠄⡰⢂⠐⢻⣧⠰⠀⢰⣷⣦⣬⣉⠛⠿⣿⣦⡀⠀⢸⡿⢀⣴⣾⣿⡿⠿⠇⢸⣿⠠⠿⣿⣿⣿⣦⣼⠀⢱⣮⠛⢦⠳⢸]],
    [[⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⢚⠩⢐⣩⡴⠞⢡⠃⠀⣿⣿⡆⠀⠈⣿⣿⠿⢿⣿⣶⣄⠙⣿⡀⠀⢀⣾⠟⢉⣠⣴⣶⣆⠹⠇⠀⠀⣿⠿⢛⠛⢿⠀⣸⣿⡇⣌⢣⢸]],
    [[⣿⣿⣿⣿⣿⣿⠷⠀⠀⠀⠀⠀⠀⠰⡀⠨⣭⣵⣶⡇⣾⢀⢰⣿⡿⠀⢀⠾⣛⡉⠀⠂⢹⣿⣿⣧⡈⢷⣶⠞⣁⣴⣿⣿⠟⠹⡟⠀⠀⠀⢠⡿⠈⣭⡅⠘⢰⣿⣿⡇⣿⡆⠆]],
    [[⣿⣿⣿⣿⢟⡕⣠⢂⣦⡉⠁⠀⠀⠀⠈⢄⠙⢿⣿⣿⡜⠸⢸⡿⢡⠇⣰⣾⣿⣿⢸⡄⢿⣿⣿⠁⠉⢠⠀⠚⢻⣿⣿⡟⠸⠃⢉⠀⠀⣴⠇⠁⠈⠥⠂⢠⣿⣿⣿⠰⣿⢃⠀]],
}

vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
        local function _trigger()
            vim.api.nvim_exec_autocmds("User", { pattern = "IceLoad" })
        end

        if vim.bo.filetype == "dashboard" then
            vim.api.nvim_create_autocmd("BufRead", {
                once = true,
                callback = _trigger,
            })
        else
            _trigger()
        end
    end,
})

return {
    "goolord/alpha-nvim",
    dependencies = {
        "DaikyXendo/nvim-material-icon",
        "nvim-neo-tree/neo-tree.nvim",
        "akinsho/toggleterm.nvim",
    },
    lazy = true,
    event = "VimEnter",
    config = function()
        local dashboard = require("alpha.themes.dashboard")
        dashboard.section.header.val = dashboard_image
        dashboard.section.buttons.val = {
            dashboard.button("q", "󰈆  Quit", "<CMD>q<CR>"),
        }
        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.hl = "AlphaButtons"
            button.opts.hl_shortcut = "AlphaShortcut"
        end
        dashboard.section.header.opts.hl = "AlphaHeader"
        dashboard.section.buttons.opts.hl = "AlphaButtons"
        dashboard.section.footer.opts.hl = "AlphaFooter"
        require("alpha").setup(dashboard.opts)
    end
}
