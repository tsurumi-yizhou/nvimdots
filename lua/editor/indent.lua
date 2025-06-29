return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    lazy = true,
    event = "BufReadPre",
    opts = {
        whitespace = {
            remove_blankline_trail = false
        },
        scope = {
            enabled = true,
            show_start = false,
            show_end = false,
        },
    },
}
