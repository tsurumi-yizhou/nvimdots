return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
        flavour = "mocha",
        background = {
            light = "latte",
            dark = "mocha",
        },
        transparent_background = true,
        styles = {
            comments = { "italic" },
            conditionals = { "italic" },
            loops = {},
            functions = {},
            keywords = {},
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
        },
        integrations = {
            alpha = true,
            noice = true,
            cmp = true,
            --gitsigns = true,
            mason = true,
            nvimtree = true,
            treesitter = true,
            notify = false,
        },
    },
    config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin")
   end
}
