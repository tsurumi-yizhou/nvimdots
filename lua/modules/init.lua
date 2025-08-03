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

require("lazy").setup({
    spec = {
        { import = "modules.appearance" },
        { import = "modules.editor" },
        { import = "modules.tools" },
        { import = "modules.version" },
        { import = "modules.workflow" },
    },
    rocks = {
        enabled = true,
        herorocks = true,
    },
    dev = {
        path = "~/Projects",
        fallback = false,
    },
    ui = {
        border = "rounded",
    },
    checker = {
        enabled = true,
    },
    change_detection = {
        enabled = true,
        notify = false,
    },
    performance = {
        cache = {
            enabled = true,
        },
        reset_packpath = true,
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
    profiling = {
        loader = true,
        require = true,
    },
})

vim.cmd.colorscheme("catppuccin")
