local function resolve_executable(cmd)
    local path = vim.fn.exepath(cmd)
    if path ~= "" then
        return path
    end
    -- Use existing Mason installations without requiring Mason at startup.
    path = vim.fs.joinpath(vim.fn.stdpath("data"), "mason", "bin", cmd)
    if vim.fn.executable(path) == 1 then
        return path
    end
end

local function configure_diagnostics()
    vim.diagnostic.config({
        severity_sort = true,
        virtual_text = {
            spacing = 2,
            source = "if_many",
        },
        float = {
            border = "rounded",
            source = true,
        },
        signs = true,
        underline = true,
        update_in_insert = false,
    })
end

local function configure_keymaps()
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
        callback = function(event)
            local opts = { buffer = event.buf }
            vim.keymap.set("n", "<leader>=", function()
                vim.lsp.buf.format({ async = true })
            end, vim.tbl_extend("force", opts, { desc = "Format Buffer" }))
            vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code Action" }))
            vim.keymap.set("n", "<leader>n", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename" }))
            vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Goto Definition" }))
            vim.keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Goto Declaration" }))
            vim.keymap.set("n", "<leader>ci", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "Goto Implementation" }))
            vim.keymap.set("n", "<leader>cR", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "Goto References" }))
            vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover" }))
            vim.keymap.set("n", "<leader>ct", vim.lsp.buf.type_definition, vim.tbl_extend("force", opts, { desc = "Goto Type Definition" }))
        end,
    })
end

local function configure_special_servers()
    vim.lsp.config("lua_ls", {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    checkThirdParty = true,
                    library = {
                        vim.env.VIMRUNTIME,
                        vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua",
                        vim.fn.stdpath("data") .. "/lazy/nvim-lspconfig/lua",
                    },
                },
            },
        },
    })
    if resolve_executable("vscode-json-language-server") then
        local schemas = {}
        local ok, schemastore = pcall(require, "schemastore")
        if ok then
            schemas = schemastore.json.schemas()
        end
        vim.lsp.config("jsonls", {
            cmd = { "vscode-json-language-server", "--stdio" },
            settings = {
                json = {
                    schemas = schemas,
                    validate = { enable = true },
                },
            },
        })
    end
end

local function enable_available_servers()
    -- Keep discovery bounded: scanning every LSP blocks file opening on WSL.
    for _, name in ipairs({ "lua_ls", "jsonls", "marksman", "taplo" }) do
        local config = vim.lsp.config[name]
        local cmd = config and config.cmd
        local executable = type(cmd) == "table" and resolve_executable(cmd[1])
        if executable then
            cmd = vim.deepcopy(cmd)
            cmd[1] = executable
            vim.lsp.config(name, { cmd = cmd })
            vim.lsp.enable(name)
        end
    end
end

return {
    {
        "b0o/schemastore.nvim",
        lazy = true,
        ft = { "json", "jsonc" },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "saghen/blink.cmp" },
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            vim.lsp.config("*", {
                capabilities = require("blink.cmp").get_lsp_capabilities(),
            })
            configure_diagnostics()
            configure_keymaps()
            configure_special_servers()
            enable_available_servers()
        end,
    },
}
