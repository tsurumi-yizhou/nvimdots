return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "BurntSushi/ripgrep",
        "nvim-telescope/telescope-frecency.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make"
        }
    },
    keys = {
        { "<leader>ff", "<CMD>Telescope find_files<CR>", },
        { "<leader>fg", "<CMD>Telescope live_grep<CR>", },
        { "<leader>fb", "<CMD>Telescope buffers<CR>", },
        { "<leader>fh", "<CMD>Telescope help_tags<CR>", },
        { "<leader>fr", "<CMD>Telescope oldfiles<CR>", },
    },
    opts = {
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            }
        }
    },
    config = function(_, opts)
        require("telescope").setup(opts)
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("frecency")
    end,
}

