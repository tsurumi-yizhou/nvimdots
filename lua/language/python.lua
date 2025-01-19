local setup_python = function()
    require('lspconfig').pylsp.setup{}
end

vim.api.nvim_create_autocmd({"BufEnter"}, {
    pattern = "*.py",
    callback = setup_python
})

vim.g.python = {
    setup = setup_python
}

return {}
