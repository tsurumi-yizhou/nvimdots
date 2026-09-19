return {
    "mrjones2014/smart-splits.nvim",
    lazy = true,
    event = "BufReadPost",
    keys = {
        { "<leader>wh", function() require("smart-splits").move_cursor_left() end, desc = "Focus Left Window" },
        { "<leader>wj", function() require("smart-splits").move_cursor_down() end, desc = "Focus Lower Window" },
        { "<leader>wk", function() require("smart-splits").move_cursor_up() end, desc = "Focus Upper Window" },
        { "<leader>wl", function() require("smart-splits").move_cursor_right() end, desc = "Focus Right Window" },
        { "<leader>ws", "<CMD>split<CR>", desc = "Split Horizontally" },
        { "<leader>wv", "<CMD>vsplit<CR>", desc = "Split Vertically" },
        { "<leader>wq", "<CMD>close<CR>", desc = "Close Window" },
        { "<leader>w=", "<C-w>=", desc = "Equalize Windows" },
    },
    opts = {
        at_edge = "stop",
        ignore_buftypes = {
            "nofile",
            "quickfix",
            "prompt",
        },
        ignore_filetypes = {
            "neo-tree",
            "dashboard",
        },
    }
}
