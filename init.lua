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
vim.loader.enable()
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local lazypath = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy", "lazy.nvim")
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
    rocks = {
        enabled = true,
        herorocks = true,
    },
    ui = {
        border = "rounded",
        size = {
            width = 0.85,
            height = 0.85,
        }
    },
    checker = {
        enabled = true
    },
    change_detection = {
        enabled = true,
        notify = false,
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
}
vim.cmd.colorscheme("catppuccin")

--require("languages").setup()
