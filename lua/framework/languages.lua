local path = vim.fs.joinpath(".nvim", "languages.json")
local configs = {}
if vim.fn.filereadable(path) then
    local file = io.open(path, "r")
    ---@diagnostic disable-next-line: need-check-nil
    local content = file:read("a")
    ---@diagnostic disable-next-line: need-check-nil
    file:close()
    local success, json = pcall(vim.json.decode, content)
    if success then
        configs = json
    else
        vim.notify_once("Failed to decode languages.json")
    end
end

return {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = "BufReadPre",
    config = function()
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
