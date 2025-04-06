vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.syntax = "on"
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.loop.fs_stat(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")

require("lazy").setup({
    spec = {
        { import = "appearance" },
        { import = "editor" },
        { import = "tools" },
        { import = "framework" },
    },
    checker = { enabled = true },
})