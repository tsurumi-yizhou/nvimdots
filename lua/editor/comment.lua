return {
    {
        "folke/todo-comments.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        opts = {}
    },
    {
        "numToStr/Comment.nvim",
        opts = {
            toggler = {
                line = "<leader>cl",
                block = "<leader>cb"
            }
        }
    }
}

