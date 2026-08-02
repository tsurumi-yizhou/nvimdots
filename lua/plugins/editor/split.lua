return {
    "mrjones2014/smart-splits.nvim",
    lazy = true,
    event = "BufReadPost",
    keys = {
        { "<TAB>h", function() require("smart-splits").move_cursor_left() end, desc = "Move cursor to left" },
        { "<TAB>j", function() require("smart-splits").move_cursor_down() end, desc = "Move cursor to down" },
        { "<TAB>k", function() require("smart-splits").move_cursor_up() end, desc = "Move cursor to up" },
        { "<TAB>l", function() require("smart-splits").move_cursor_right() end, desc = "Move cursor to right" },
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
