local function ensure_mason_package(bin, pkg, on_ready)
    if vim.fn.executable(bin) == 1 then
        if on_ready then pcall(on_ready) end
        return
    end
    local ok, mr = pcall(require, "mason-registry")
    if not ok then
        vim.notify("mason-registry not available; please install mason.nvim", vim.log.levels.WARN)
        if on_ready then pcall(on_ready) end
        return
    end
    if not mr.is_installed(pkg) then
        local pkg_obj = mr.get_package(pkg)
        pkg_obj:install()
        vim.notify(string.format("Installing %s via Mason (background)...", pkg), vim.log.levels.INFO)
        local timer = vim.loop.new_timer()
        local max_checks = 600 -- 10 minutes
        local checks = 0
        timer:start(1000, 1000, vim.schedule_wrap(function()
            checks = checks + 1
            if vim.fn.executable(bin) == 1 or mr.is_installed(pkg) or checks >= max_checks then
                timer:stop()
                timer:close()
                if vim.fn.executable(bin) == 1 or mr.is_installed(pkg) then
                    vim.notify(string.format("%s installed", pkg), vim.log.levels.INFO)
                else
                    vim.notify(string.format("Failed to install %s (timeout)", pkg), vim.log.levels.ERROR)
                end
                if on_ready then pcall(on_ready) end
            end
        end))
    else
        if on_ready then pcall(on_ready) end
    end
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "json", "jsonc" },
    callback = function()
        ensure_mason_package("vscode-json-language-server", "vscode-json-language-server", function()
            vim.lsp.config("jsonls", {
                cmd = { "vscode-json-language-server", "--stdio" },
                filetypes = { "json", "jsonc" },
                init_options = {
                    provideFormatter = true,
                },
                root_dir = vim.fn.getcwd(),
                single_file_support = true,
                settings = {
                    json = {
                        schemas = require("schemastore").json.schemas(),
                        validate = { enable = true },
                    },
                },
            })
            vim.lsp.enable("jsonls")
        end)
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "lua" },
    callback = function()
        ensure_mason_package("lua-language-server", "lua-language-server", function()
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        workspace = {
                            checkThirdParty = true,
                            library = {
                                vim.env.VIMRUNTIME,
                                vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua"
                            }
                        },
                        diagnostics = {
                            globals = { "vim" }
                        }
                    }
                }
            })
        end)
        vim.lsp.enable("lua_ls")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "toml" },
    callback = function()
        ensure_mason_package("taplo", "taplo", function()
            vim.lsp.config("taplo", {
                cmd = { "taplo" },
                filetypes = { "toml" },
                root_dir = vim.fn.getcwd(),
                single_file_support = true,
            })
            vim.lsp.enable("taplo")
        end)
    end,
})

return {
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        keys = {
            { "<leader>cm", "<CMD>Mason<CR>", desc = "Mason" }
        },
        opts = {
            PATH = "prepend",
            ui = {
                border = "rounded",
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        event = "VeryLazy",
        dependencies = {
            "b0o/schemastore.nvim",
            "williamboman/mason.nvim",
        },
        keys = {
            { "<leader>ca", vim.lsp.buf.code_action,     desc = "Code Action" },
            { "<leader>F",  vim.lsp.buf.format,          desc = "Format Code" },
            { "<leader>rn", vim.lsp.buf.rename,          desc = "Rename" },
            { "<leader>gd", vim.lsp.buf.definition,      desc = "Goto Definition" },
            { "<leader>gD", vim.lsp.buf.declaration,     desc = "Goto Declaration" },
            { "<leader>gi", vim.lsp.buf.implementation,  desc = "Goto Implementation" },
            { "<leader>gr", vim.lsp.buf.references,      desc = "Goto References" },
            { "<leader>gh", vim.lsp.buf.hover,           desc = "Goto Hover" },
            { "<leader>gt", vim.lsp.buf.type_definition, desc = "Goto Type Definition" },
        },
    }
}
