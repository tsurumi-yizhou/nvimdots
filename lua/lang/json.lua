local setup_json = function ()
    vim.notify_once("Enable Json")
    vim.opt.syntax = 'on'
    vim.opt.number = true
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.softtabstop = 4
    vim.opt.expandtab = true
    vim.opt.autoindent = true
    vim.opt.smartindent = true

    require('lspconfig').jsonls.setup {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = function (client, bufnr)
            vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, {buffer = bufnr})
        end,
        settings = {
            json = {
                schemas = require('schemastore').json.schemas(),
                validate = { enable = true },
            },
        },
    }
end

vim.g.json = {
    setup = setup_json
}

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.json"},
    callback = setup_json,
})

return {
    "b0o/schemastore.nvim",
}


