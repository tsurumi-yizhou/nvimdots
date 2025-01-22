local setup_clangd = function(env)
    vim.notify_once("Enable Clangd")
    vim.opt.syntax = 'on'
    vim.opt.number = true
    vim.opt.tabstop = 4       
    vim.opt.shiftwidth = 4   
    vim.opt.softtabstop = 4  
    vim.opt.expandtab = true 
    vim.opt.autoindent = true
    vim.opt.smartindent = true

    require("lspconfig").clangd.setup {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        keys = {
            { 'gf', vim.lsp.buf.declaration },
            { 'gd', vim.lsp.buf.definition },
            { 'K', vim.lsp.buf.hover },
            { 'gi', vim.lsp.buf.implementation },
            { '<leader>rn', vim.lsp.buf.rename },
            { '<leader>ca', vim.lsp.buf.code_action }
        },
        cmd = {
            "clangd",
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

if vim.g.platform == "Darwin" or vim.g.platform == "Linux" then
    vim.g.cpp = {
        setup = setup_clangd,
    }
end

return {}
