require("dap").adapters.gdb = {
    name = "gdb",
    type = "executable",
    command = "/usr/local/bin/gdb"
}

if vim.g.platform == "Linux" then
    vim.g.debugger = "gdb"
end

return {}
