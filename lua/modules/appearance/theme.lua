vim.api.nvim_create_autocmd("UIEnter", {
    callback = function()
        vim.cmd.colorscheme("catppuccin")
    end
})

return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    opts = {
        background = {
            light = "latte",
            dark = "mocha",
        },
        transparent_background = true,
        styles = {
            comments = { "italic" },
            conditionals = { "italic" },
            loops = { "bold" },
            functions = { "bold" },
            keywords = { "bold" },
            strings = { "italic" },
            variables = { "italic" },
            numbers = { "italic" },
            booleans = { "bold" },
            properties = { "italic" },
            types = { "italic" },
            operators = { "italic" },
        },
        integrations = {
            aerial = true,
            alpha = true,
            blink_cmp = {
                style = "bordered",
            },
            dashboard = true,
            fidget = true,
            gitsigns = true,
            indent_blankline = {
                enabled = true,
                colored_indent_levels = true,
            },
            neotree = true,
            neotest = true,
            noice = true,
            dap = true,
            dap_ui = true,
            notify = true,
            treesitter = true,
            overseer = true,
            snacks = {
                enabled = true,
            },
            telescope = {
                enabled = true,
                style = "bordered",
            },
        },
    },
}
