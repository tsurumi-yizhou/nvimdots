require("dap").adapters.lldb = {
    type = 'executable',
    command = '/opt/homebrew/opt/llvm/bin/lldb-dap',
    name = 'lldb'
}

return {}
