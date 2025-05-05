vim.lsp.setup["python"] = function(exe, path)
    vim.lsp.config["python"] = {
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = {"python"},
        root_dir = vim.fn.getcwd(),
        settings = {
            python = {
                pythonPath = vim.fn.trim(exe),
                venePath = vim.fn.trim(path),
                analysis = {
                    logLevel = "Error",
                    autoImportCompletions = true,
                    autoSearchPaths = true,
                    diagnosticMode = "workspace",
                    typeCheckingMode = "standard",
                    useLibraryCodeForTypes = true
                }
            }
        }
    }
    vim.lsp.enable("python")
end

return {}
