vim.lsp.setup["latex"] = function()
    vim.lsp.config["latex"] = {
        cmd = { "texlab" },
        filetypes = { "tex", "bib" },
        root_dir = vim.fn.getcwd(),
    }
    vim.lsp.enable("latex")
end

return {}
