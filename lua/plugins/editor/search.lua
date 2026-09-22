return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "lazygit.nvim",
            "nvim-telescope/telescope-frecency.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        cmd = "Telescope",
        keys = {
            { "<leader>ff", "<CMD>Telescope find_files<CR>", desc = "Find Files" },
            { "<leader>fg", "<CMD>Telescope live_grep<CR>",  desc = "Search In Files" },
            { "<leader>fb", "<CMD>Telescope buffers<CR>",    desc = "Find Buffers" },
            { "<leader>fh", "<CMD>Telescope help_tags<CR>",  desc = "Find Help" },
            { "<leader>fp", "<CMD>Telescope oldfiles<CR>",   desc = "Find Recent Files" },
        },
        opts = {
            defaults = {
                layout_config = {
                    prompt_position = "top",
                },
                sorting_strategy = "ascending",
                file_ignore_patterns = {
                    "node_modules",
                    "%.git/",
                    "dist",
                    "build",
                    "target",
                    "%.png",
                    "%.jpg",
                    "%.gif",
                    "%.pdf",
                    "%.root",
                    "%.vcxproj",
                    "%.vcproj",
                    "%.notes",
                    "Online.*%.xml",
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
                frecency = {},
                lazygit = {},
            }
        },
        config = function(_, opts)
            local telescope = require("telescope")
            telescope.setup(opts)
            telescope.load_extension("fzf")
            telescope.load_extension("frecency")
            telescope.load_extension("lazygit")
        end,
    }
}
