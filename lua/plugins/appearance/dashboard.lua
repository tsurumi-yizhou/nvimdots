return {
    "goolord/alpha-nvim",
    dependencies = {
        "DaikyXendo/nvim-material-icon",
    },
    event = "VimEnter",
    config = function()
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            "                                                    ",
            " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
            " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
            " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
            " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
            " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
            " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
            "                                                    ",
        }
        dashboard.section.header.opts.hl = "AlphaHeader"
        dashboard.section.buttons.val = {
            dashboard.button("SPC f", "  Find File", "<CMD>Telescope find_files<CR>"),
            dashboard.button("SPC p", "  Recent Files", "<CMD>Telescope oldfiles<CR>"),
            dashboard.button("SPC s", "  Find Text", "<CMD>Telescope live_grep<CR>"),
            dashboard.button("n", "  New File", "<CMD>ene <BAR> startinsert<CR>"),
            dashboard.button("q", "  Quit", "<CMD>q<CR>"),
        }
        dashboard.section.buttons.opts.hl = "AlphaButtons"
        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.hl = "AlphaButtons"
            button.opts.hl_shortcut = "AlphaShortcut"
        end


        local stats = require("lazy").stats()
        local version = vim.version()
        dashboard.section.footer.val = {
            string.format(
                "󰂖 %d plugins loaded   v%d.%d.%d",
                stats.loaded,
                version.major,
                version.minor,
                version.patch
            )
        }
        dashboard.section.footer.opts.hl = "AlphaFooter"

        require("alpha").setup(dashboard.opts)
    end
}
