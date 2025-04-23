vim.lsp.setup["cpp"] = function (build_dir, cache_limit)
    local dir = vim.fs.joinpath(build_dir or "build", ".clice")
    local path = vim.fs.joinpath(dir, "clice.toml")
    vim.fn.mkdir(dir, "p")
    local file = io.open(path, "w")
    
    local config = [[
[server]
moduleSupport=true
compile_commands_dirs=["%s"]
[cache]
dir="%s/cache"
limit=%d
[index]
dir="%s/index"
    ]]
    file:write(config:format(build_dir or "build", dir, cache_limit or 0, dir))
    file:close()

    vim.lsp.config["cpp"] = {
        cmd = {
            "clice",
            "--mode=pipe",
            "--resource-dir=" .. vim.fn.getcwd(),
            "--config=" .. path
        },
        filetypes = { "hpp", "cpp", "cppm" },
        root_dir = vim.fn.getcwd(),
    }
    vim.lsp.enable("cpp")
end

return {}
