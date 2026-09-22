return {
    "lima1909/resty.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    cmd = "Resty",
    keys = {
        { "<leader>rr", "<CMD>Resty run<CR>", desc = "Run HTTP Request" },
    },
    opts = {
        response = {
            output_window_split = "right",
        },
    },
}
