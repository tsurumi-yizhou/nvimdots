local setup_cpp = function(env)
    if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
    else
        require("lspconfig").clangd.setup {
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
                "/opt/homebrew/opt/llvm/bin/clangd",
                "--compile-commands-dir=" .. vim.fn.getcwd() .. "/build/Debug",
                "--query-driver=/opt/homebrew/opt/llvm/bin/clang++",
                "--all-scopes-completion",
                "--background-index",
                "--clang-tidy",
                "--completion-style=bundled",
                "--experimental-modules-support",
                "--fallback-style=LLVM",
                "--function-arg-placeholders",
                "--header-insertion=never",
                "--enable-config",
                "-j=12",
                "--pch-storage=memory"
            }
        }
    end
end

vim.g.cpp = {
    setup = setup_cpp
}

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = { "*.cpp", "*.hpp", "*.cppm" },
    callback = setup_cpp
})

return {}
