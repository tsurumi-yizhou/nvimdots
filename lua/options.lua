vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.undofile = true
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- 诊断显示（核心配置，非插件：诊断本身由 LSP / 其它来源产生）
vim.diagnostic.config({
    severity_sort = true,
    virtual_text = {
        spacing = 2,
        source = "if_many",
    },
    float = {
        border = "rounded",
        source = true,
    },
    signs = true,
    underline = true,
    update_in_insert = false,
})

