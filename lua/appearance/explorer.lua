return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "DaikyXendo/nvim-material-icon",
        "MunifTanjim/nui.nvim",
        "akinsho/bufferline.nvim",
    },
    lazy = true,
    keys = {
        { "<leader>e", "<CMD>Neotree focus<CR>", desc = "Toggle File Explorer" },
        { "<leader>ve", "<CMD>Neotree toggle<CR>", desc = "Close File Explorer" },
    },
    opts = {
        close_if_last_window = true,
        enable_git_status = true,
        enable_diagnostics = true,
        window = {
            width = 35,
        },
        filesystem = {
            follow_current_file = { enabled = true },
            hijack_netrw = true,
            filtered_items = {
                visible = true,
            },
        },
        default_component_configs = {
            icon = {
                folder_closed = "",
                folder_open = "",
                folder_empty = "",
                default = "",
                highlight = "NeoTreeFileIcon",
            },
            git_status = {
                symbols = {
                    added = "",
                    deleted = "",
                    modified = "",
                    renamed = "➜",
                    untracked = "M",
                    ignored = "◌",
                    unstaged = "✗",
                    staged = "✓",
                    conflict = "",
                },
            },
            diagnostics = {
                enable = true,
                show_on_dirs = true,
                severity = {
                    min = vim.diagnostic.severity.HINT,
                    max = vim.diagnostic.severity.ERROR,
                },
                symbols = {
                    hint = " ",
                    info = " ",
                    warn = " ",
                    error = " ",
                },
            },
        },
    },
}
