vim.lsp.setup["typst"] = function ()
    vim.lsp.config["typst"] = {
        cmd = { "tinymist" },
        filetypes = { "typst" },
        settings = {
            exportTarget = "html",
            rootPath = vim.fn.getcwd(),
            systemFonts = true,
        }
    }
    vim.lsp.enable("typst")
end

return {}
