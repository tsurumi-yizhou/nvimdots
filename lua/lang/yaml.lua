local setup_yaml = function ()
    vim.notify_once("Enable Yaml")
    vim.opt.syntax = 'on'
    vim.opt.number = true
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.softtabstop = 4
    vim.opt.expandtab = true
    vim.opt.autoindent = true
    vim.opt.smartindent = true

    require('lspconfig').yamlls.setup {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = function (client, bufnr)
            vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, {buffer = bufnr})
        end,
        settings = {
            yaml = {
                schemaStore = {},
                schemas = require('schemastore').yaml.schemas(),
            },
        },
    }
end

vim.g.yaml = {
    setup = setup_yaml
}

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.yaml", "*.yml"},
    callback = setup_yaml,
})

return {
    "b0o/schemastore.nvim",
}
