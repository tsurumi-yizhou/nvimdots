return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim",              -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        keys = {
            { "<leader>e", ":Neotree toggle<CR>" },
        },
        config = function()
            require('neo-tree').setup {
                close_if_last_window = true,
                window = {
                    width = 40,
                    mappings = {
                        ["<leader>e"] = "toggle", -- 用于切换 Neo-tree
                    },
                },
                filesystem = {
                    follow_current_file = true,
                },
            }
        end
    }
}
