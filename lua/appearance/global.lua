vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        vim.opt.number = true      -- 显示绝对行号
        vim.opt.relativenumber = false -- 显示相对行号
    end,
})

return {}
