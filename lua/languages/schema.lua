return {
    "b0o/schemastore.nvim",
    event = "VeryLazy",
    config = function()
        vim.lsp.config["json"] = {
            cmd = { "vscode-json-language-server", "--stdio" },
            filetypes = { "json" },
            root_dir = vim.fn.getcwd(),
            settings = {
                json = {
                    schemas = require("schemastore").json.schemas(),
                    validate = { enable = true }
                }
            }
        }
        vim.lsp.enable("json")
    end
}
