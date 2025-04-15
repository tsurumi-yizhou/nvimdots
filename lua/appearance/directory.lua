return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup {
                close_if_last_window = true,
                window = {
                    width = 40,
                },
                filesystem = {
                    filtered_items = {
                        visible = false,
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
            vim.keymap.set("n", "<leader>ee", "<CMD>Neotree toggle<CR>")
            vim.keymap.set("n", "<leader>ef", "<CMD>Neotree focus<CR>")
        end
    }
}
