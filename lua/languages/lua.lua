vim.lsp.setup["lua"] = function (libraries)
    vim.lsp.config["lua"] = {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        root_dir = vim.fn.getcwd(),
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT"
                },
                workspace = {
                    checkThirdParty = true,
                    library = libraries
                }
            }
        }
    }
    vim.lsp.enable("lua")
end

return {}
