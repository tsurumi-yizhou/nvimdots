return {
    "lima1909/resty.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    lazy = true,
    cmd = "Resty",
    keys = {
        { "<leader>rr", "<CMD>Resty run<CR>", desc = "Run HTTP Request" },
    },
    opts = {
        response = {
            output_window_split = "right",
        },
        -- Set request timeouts in .http files, e.g. @cfg.timeout = 2000.
    },
}
