vim.lsp.setup["cmake"] = function(build_dir)
    vim.lsp.config["cmake"] = {
        cmd = { "cmake-language-server" },
        filetypes = { "txt" },
        root_dir = vim.fn.getcwd(),
        init_options = {
            buildDirectory = build_dir
        }
    }
    vim.lsp.enable("cmake")
end

return {}
