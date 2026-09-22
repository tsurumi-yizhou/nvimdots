return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
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
