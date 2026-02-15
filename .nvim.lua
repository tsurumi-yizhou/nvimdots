vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            workspace = {
                checkThirdParty = true,
                library = {
                    vim.env.VIMRUNTIME,
                    vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua"
                }
            },
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
})
vim.lsp.enable("lua_ls")