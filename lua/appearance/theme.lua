return {
    {
        "catppuccin/nvim",
        config = function()
            vim.cmd.colorscheme "catppuccin"
            require("catppuccin").setup {
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
            }
        end
    }
}
