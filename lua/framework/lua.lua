vim.api.nvim_create_autocmd({ "VimEnter" }, {
    callback = function()
        if #vim.fn.glob("init.lua") > 0 then
            vim.lsp.config("luals", {
                cmd = { "lua-language-server" },
                filetypes = { "lua" },
                root_dir = vim.fn.getcwd(),
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                        },
                        workspace = {
                            checkThirdParty = true,
                            library = {
                                vim.env.VIMRUNTIME,
                            },
                        }
                    }
                }
            })
            vim.lsp.enable("luals")
        end
    end
})

return {}
