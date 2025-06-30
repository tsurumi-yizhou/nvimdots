local path = vim.fs.joinpath(".nvim", "languages.json")
local configs = {}
if vim.fn.filereadable(path) == 1 then
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
    keys = {
        { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action" },
        { "<leader>F", vim.lsp.buf.format, desc = "Format" },
        { "<leader>rn", vim.lsp.buf.rename, desc = "Rename" },
        { "<leader>gd", vim.lsp.buf.definition, desc = "Goto Definition" },
        { "<leader>gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
        { "<leader>gi", vim.lsp.buf.implementation, desc = "Goto Implementation" },
        { "<leader>gr", vim.lsp.buf.references, desc = "Goto References" },
        { "<leader>gt", vim.lsp.buf.type_definition, desc = "Goto Type Definition" },
        { "<leader>gs", vim.lsp.buf.signature_help, desc = "Signature Help" },
        { "<leader>gl", vim.diagnostic.open_float, desc = "Line Diagnostics" },
    },
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
