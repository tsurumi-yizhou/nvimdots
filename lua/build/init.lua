return {
    dir = "~/Projects/build.nvim",
    opts = {
        setup_at_start = true,
        lua = {
            post_setup = function(libraries)
                vim.lsp.setup["lua"](libraries)
            end
        },
        cmake = {
            post_setup = function(build_dir)
                vim.lsp.setup["cmake"](build_dir)
                vim.lsp.setup["cpp"](build_dir, 0)
            end
        },
        astro = {
            post_setup = function(tsserver, runtime)
                vim.lsp.setup["astro"](tsserver, runtime)
            end
        },
        poetry = {
            post_setup = function(env, exe, path)
                vim.lsp.setup["python"](exe, path)
            end
        }
    }
}
