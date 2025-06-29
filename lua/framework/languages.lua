local path = vim.fs.joinpath(".nvim", "languages.json")

return {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = "BufReadPre",
    config = function()
        if vim.fn.filereadable(path) == 0 then
            vim.notify("Languages configuration file not found: " .. path, vim.log.levels.WARN)
            return
        end

        local file = io.open(path, "r")
        if not file then return end
        local content = file:read("*a")
        file:close()

        local success, configs = pcall(vim.json.decode, content)
        if not success then
            vim.notify("Failed to parse languages configuration file: " .. path, vim.log.levels.ERROR)
            return
        end

        for lang, config in pairs(configs) do
            local executable = config.cmd[1]
            if not vim.fn.executable(executable) then
                vim.notify("Executable not found: " .. executable, vim.log.levels.ERROR)
                return
            end
            vim.lsp.config[lang] = config
            vim.lsp.enable(lang)
        end
    end
}
