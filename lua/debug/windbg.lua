require("dap").adapters.windbg = {
    name = "windbg",
    type = "executable",
    command = "",
}

if vim.g.platform == "Windows" or vim.g.platform == "Windows_NT" then
    vim.g.debugger = "windbg"
end

return {}
