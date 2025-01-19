local setup_lua = function (env)
    require("lspconfig").lua_ls.setup {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        keys = {
            { 'gf', '<cmd>lua vim.lsp.buf.declaration()<CR>' },
            { 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>' },
            { 'K', '<cmd>lua vim.lsp.buf.hover()<CR>' },
            { 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>' },
            { '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>' },
            { '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>' }
        },
        cmd = {
            "lua-language-server",
            "--logpath=/tmp/lua-language-server",
            "--metapath=/tmp/lua-language-server",
            "--root-path=/tmp/lua-language-server",
            "--settings=/tmp/lua-language-server",
        }
    }
end

vim.g.lua = {
    setup = setup_lua
}

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.lua"},
  callback = setup_lua
})

return {}
