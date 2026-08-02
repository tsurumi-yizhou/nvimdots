local function executable_from_cmd(cmd)
    if type(cmd) == "table" then
        return cmd[1]
    end
    if type(cmd) == "string" then
        return cmd
    end
end

local function is_executable(cmd)
    return cmd and vim.fn.executable(cmd) == 1
end

local function server_name(path)
    return vim.fn.fnamemodify(path, ":t:r")
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
    vim.keymap.set("n", "<leader>F", function()
        vim.lsp.buf.format({ async = true })
    end, { desc = "Auto Format" })

    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
            local opts = { buffer = event.buf }
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code Action" }))
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename" }))
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Goto Definition" }))
            vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Goto Declaration" }))
            vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "Goto Implementation" }))
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "Goto References" }))
            vim.keymap.set("n", "<leader>gh", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover" }))
            vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, vim.tbl_extend("force", opts, { desc = "Goto Type Definition" }))
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
                    checkThirdParty = false,
                    library = {
                        vim.env.VIMRUNTIME,
                        vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua",
                        vim.fn.stdpath("data") .. "/lazy/nvim-lspconfig/lua",
                    },
                },
            },
        },
    })
    if is_executable("vscode-json-language-server") then
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
    local enabled = {}
    for _, path in ipairs(vim.api.nvim_get_runtime_file("lsp/*.lua", true)) do
        local name = server_name(path)
        if not enabled[name] then
            local config = vim.lsp.config[name]
            local executable = config and executable_from_cmd(config.cmd)
            if is_executable(executable) then
                vim.lsp.enable(name)
                enabled[name] = true
            end
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
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            configure_diagnostics()
            configure_keymaps()
            configure_special_servers()
            enable_available_servers()
        end,
    },
}
