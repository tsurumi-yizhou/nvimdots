return {
    "lima1909/resty.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    lazy = true,
    keys = {
        { "<leader>rh", "<CMD>Resty run<CR>", desc = "Launch Http Requests" },
    },
    opts = {
        result = {
            split = "tab",
        },
        history = {
            enabled = true,
            path = vim.fs.joinpath(vim.fn.stdpath("data"), "requests.json"),
            save_response = true,
            max_count = 100,
        },
        timeout = 2000,
    },
}
