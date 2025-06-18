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
vim.lsp.setup = {}
vim.build = {}

local lazypath = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy", "lazy.nvim")
---@diagnostic disable-next-line: undefined-field
if not vim.uv.fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
    spec = {
        { import = "appearance" },
        { import = "editor" },
        { import = "version" },
        { import = "tools" },
    },
    checker = { enabled = true }
}
