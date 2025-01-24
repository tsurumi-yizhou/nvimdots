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
                    },
                },
                filesystem = {
                    filtered_items = {
                        visible = false, -- hide filtered items on open
                        hide_gitignored = true,
                        hide_dotfiles = false,
                        hide_by_name = {
                            "package-lock.json",
                            ".changeset",
                            ".prettierrc.json",
                        },
                    },
                },
            }
        end
    }
}
