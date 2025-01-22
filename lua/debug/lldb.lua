require("dap").adapters.lldb = {
    name = "lldb",
    type = "executable",
    command = "/opt/homebrew/opt/llvm/bin/lldb-dap",
}

if vim.g.platform == "Darwin" then
    vim.g.debugger = "lldb"
end

return {}
