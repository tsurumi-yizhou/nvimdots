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
    lazy = true,
    keys = {
        { "<leader>ff", "<CMD>Telescope find_files<CR>", desc = "Find Files" },
        { "<leader>fg", "<CMD>Telescope live_grep<CR>", desc = "Search In Files" },
        { "<leader>fb", "<CMD>Telescope buffers<CR>", desc = "Find Buffers" },
        { "<leader>fh", "<CMD>Telescope help_tags<CR>", desc = "Find Help" },
        { "<leader>fr", "<CMD>Telescope oldfiles<CR>", desc = "Find Recent Files"  },
    },
    opts = {
        defaults = {
            layout_config = {
                prompt_position = "top",
            },
            sorting_strategy = "ascending",
            file_ignore_patterns = {
                "logs",
                "%.md",
                "%.root",
                "%.gif",
                "%.pdf",
                "%.png",
                "%.vcxproj",
                "%.vcproj",
                "%.notes",
                "%.json",
                "%.rst",
                "%.bat",
                "%.css",
                "%.cxx",
                "%.cmake",
                "Online.*%.xml",
            },
        },
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

