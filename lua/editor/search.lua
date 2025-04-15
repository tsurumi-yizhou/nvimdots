return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "BurntSushi/ripgrep",
        },
        keys = {
            { "<leader>ff", "<CMD>Telescope find_files<CR>", },
            { "<leader>fg", "<CMD>Telescope live_grep<CR>", },
            { "<leader>fb", "<CMD>Telescope buffers<CR>", },
            { "<leader>fh", "<CMD>Telescope help_tags<CR>", },
            { "<leader>fr", "<CMD>Telescope oldfiles<CR>", },
        },
        config = function()
            require("telescope").setup {
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    }
                }
            }
        end
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
        build = [[
            cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release
            cmake --build build --config Release
        ]],
        config = function()
            --require("telescope").load_extension("fzf")
        end
    },
    {
        "nvim-telescope/telescope-frecency.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("telescope").load_extension("frecency")
        end
    }
}