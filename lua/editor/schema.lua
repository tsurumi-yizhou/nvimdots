return {
    "b0o/schemastore.nvim",
    config = function()
        vim.lsp.config("jsonls", {
            cmd = { "vscode-json-language-server", "--stdio" },
            filetypes = { "json" },
            root_dir = vim.fn.getcwd(),
            settings = {
                json = {
                    schemas = require('schemastore').json.schemas(),
                },
            },
        })
        vim.lsp.config("yamlls", {
            cmd = { "yaml-language-server", "--stdio" },
            filetypes = { "yaml" },
            root_dir = vim.fn.getcwd(),
            settings = {
                yaml = {
                    schemas = require('schemastore').yaml.schemas(),
                },
            },
        })
        vim.lsp.config("taplo", {
            cmd = { "taplo", "lsp", "stdio" },
            filetypes = { "toml" },
            root_dir = vim.fn.getcwd(),
        })
        vim.lsp.enable({"jsonls", "yamlls", "taplo"})
    end
}