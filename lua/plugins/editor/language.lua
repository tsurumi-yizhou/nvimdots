return {
    {
        "b0o/schemastore.nvim",
        lazy = true
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "saghen/blink.cmp" },
        event = { "BufReadPre", "BufNewFile" },
        keys = {
            { "<leader>F", function() vim.lsp.buf.format({ async = true }) end, desc = "Format Buffer" },
            { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action" },
            { "<leader>rn", vim.lsp.buf.rename, desc = "Rename" },
            { "<leader>cd", vim.lsp.buf.definition, desc = "Goto Definition" },
            { "<leader>cD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
            { "<leader>ci", vim.lsp.buf.implementation, desc = "Goto Implementation" },
            { "<leader>cR", vim.lsp.buf.references, desc = "Goto References" },
            { "<leader>ch", vim.lsp.buf.hover, desc = "Hover" },
            { "<leader>ct", vim.lsp.buf.type_definition, desc = "Goto Type Definition" },
        },
        config = function()
        end,
    },
}
