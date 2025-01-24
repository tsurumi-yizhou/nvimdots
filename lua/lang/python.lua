local setup_python = function()
    vim.notify_once("Enable Python")    
    vim.opt.syntax = 'on'
    vim.opt.number = true
    vim.opt.tabstop = 4       
    vim.opt.shiftwidth = 4   
    vim.opt.softtabstop = 4  
    vim.opt.expandtab = true 
    vim.opt.autoindent = true
    vim.opt.smartindent = true
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
