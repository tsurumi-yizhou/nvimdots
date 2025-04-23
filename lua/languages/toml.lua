vim.lsp.setup["toml"] = function()
    vim.lsp.config["toml"] = {
        cmd = { "taplo", "lsp", "stdio" },
        filetypes = { "toml" },
        root_dir = vim.fn.getcwd(),
    }
    vim.lsp.enable("toml")
end

return {}
