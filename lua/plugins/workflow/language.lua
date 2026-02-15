vim.api.nvim_create_autocmd("FileType", {
    pattern = { "json", "jsonc" },
    callback = function()
        vim.lsp.config("jsonls", {
            cmd = { "vscode-json-language-server", "--stdio" },
            filetypes = { "json", "jsonc" },
            init_options = {
                provideFormatter = true,
            },
            root_dir = vim.fn.getcwd(),
            single_file_support = true,
            settings = {
                json = {
                    schemas = require("schemastore").json.schemas(),
                    validate = { enable = true },
                },
            },
        })
        vim.lsp.enable("jsonls")
    end,
})

return {
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        keys = {
            { "<leader>cm", "<CMD>Mason<CR>", desc = "Mason" }
        },
        opts = {
            PATH = "prepend",
            ui = {
                border = "rounded",
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        event = "VeryLazy",
        dependencies = {
            "b0o/schemastore.nvim",
            "williamboman/mason.nvim",
        },
        keys = {
            { "<leader>ca", vim.lsp.buf.code_action,     desc = "Code Action" },
            { "<leader>F",  vim.lsp.buf.format,          desc = "Format Code" },
            { "<leader>rn", vim.lsp.buf.rename,          desc = "Rename" },
            { "<leader>gd", vim.lsp.buf.definition,      desc = "Goto Definition" },
            { "<leader>gD", vim.lsp.buf.declaration,     desc = "Goto Declaration" },
            { "<leader>gi", vim.lsp.buf.implementation,  desc = "Goto Implementation" },
            { "<leader>gr", vim.lsp.buf.references,      desc = "Goto References" },
            { "<leader>gh", vim.lsp.buf.hover,           desc = "Goto Hover" },
            { "<leader>gt", vim.lsp.buf.type_definition, desc = "Goto Type Definition" },
        },
    }
}
