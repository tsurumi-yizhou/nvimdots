vim.opt.termguicolors = true
if vim.fn.has("wsl") == 1 then
    local win32yank = vim.fn.exepath("win32yank.exe")
    if win32yank == "" then
        win32yank = "/mnt/c/Users/yizhou/AppData/Local/Microsoft/WinGet/Links/win32yank.exe"
    end
    if vim.fn.executable(win32yank) == 1 then
        -- Resolve the WinGet symlink before launching the Windows executable.
        win32yank = vim.fn.resolve(win32yank)
        vim.g.clipboard = {
            name = "win32yank (WSL)",
            copy = {
                ["+"] = { win32yank, "-i", "--crlf" },
                ["*"] = { win32yank, "-i", "--crlf" },
            },
            paste = {
                ["+"] = { win32yank, "-o", "--lf" },
                ["*"] = { win32yank, "-o", "--lf" },
            },
            cache_enabled = 0,
        }
    end
end
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.exrc = true
vim.opt.secure = true
vim.opt.undofile = true
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
