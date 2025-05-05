return {
    {
        "folke/todo-comments.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        event = "VeryLazy",
        opts = {}
    },
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        opts = {
            toggler = {
                line = "<leader>cl",
                block = "<leader>cb"
            }
        }
    }
}

