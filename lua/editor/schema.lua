return {
    "b0o/schemastore.nvim",
    config = function()
        vim.g.schemas = {
            json = require("schemastore").json.schemas(),
            yaml = require("schemastore").yaml.schemas(),
        }
    end
}
