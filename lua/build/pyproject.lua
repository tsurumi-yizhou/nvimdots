local setup_pyproject = function()
    if vim.fn.isdirectory(vim.fn.getcwd() .. package.config:sub(1, 1) .. ".venv") == 0 then
        if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
            vim.fn.system({"python3.exe", "-m", "venv", ".venv"})
        else
            vim.fn.system({"python3", "-m", "venv", ".venv"})
        end
    end
    require("venv-selector").setup()
    vim.g.python.setup()
end

vim.api.nvim_create_autocmd({"BufWinEnter"}, {
    callback = function()
        if vim.fn.glob(vim.fn.getcwd() .. package.config:sub(1, 1) .. "pyproject.toml") ~= "" then
            setup_pyproject()
        end
    end
})

return {
    'linux-cultist/venv-selector.nvim',
    branch = "regexp",
    dependencies = {
        'mfussenegger/nvim-dap-python'
    },
    opts = {
        name = ".venv",
        auto_refresh = true
    }
}
