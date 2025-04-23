vim.lsp.setup["astro"] = function(tsserver, runtime)
    vim.lsp.config["astro"] = {
        cmd = { "astro-ls", "--stdio" },
        filetypes = { "astro", "ts", "mts", "js", "mjs" },
        root_dir = vim.fn.getcwd(),
        init_options = {
            typescript = {
                tsdk = tsserver
            }
        },
        settings = {
            astro = {
                ["content-intellisense"] = true,
                ["language-server"] = {
                    runtime = runtime
                },
                trace = { server = "messages" },
                updateImportsOnFileMove = { enabled = true }
            }
        }
    }
    vim.lsp.enable("astro")
end

return {}
