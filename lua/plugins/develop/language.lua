vim.api.nvim_create_autocmd("FileType", {
    pattern = { "json", "jsonc", "yaml" },
    once = true,
    callback = function()
        require("lazy").load({ plugins = { "schemastore.nvim" } })
        local schemastore = require("schemastore")
        vim.lsp.config("jsonls", {
            settings = {
                json = {
                    schemas = schemastore.json.schemas(),
                    validate = { enable = true },
                },
            },
        })
        vim.lsp.config("yamlls", {
            settings = {
                yaml = {
                    schemaStore = { enable = false, url = "" },
                    schemas = schemastore.yaml.schemas(),
                },
            },
        })
        for name, cfg in pairs(require("project").lsp().config) do
            vim.lsp.config(name, cfg)
        end
    end,
})

return {
    {
        "b0o/schemastore.nvim",
        lazy = true,
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        keys = {
            { "<leader>F",  function() vim.lsp.buf.format({ async = true }) end, desc = "Format Buffer" },
            { "<leader>ca", vim.lsp.buf.code_action,                             desc = "Code Action" },
            { "<leader>rn", vim.lsp.buf.rename,                                  desc = "Rename" },
            { "<leader>cd", vim.lsp.buf.definition,                              desc = "Goto Definition" },
            { "<leader>cD", vim.lsp.buf.declaration,                             desc = "Goto Declaration" },
            { "<leader>ci", vim.lsp.buf.implementation,                          desc = "Goto Implementation" },
            { "<leader>cR", vim.lsp.buf.references,                              desc = "Goto References" },
            { "<leader>ch", vim.lsp.buf.hover,                                   desc = "Hover" },
            { "<leader>ct", vim.lsp.buf.type_definition,                         desc = "Goto Type Definition" },
        },
        config = function()
            local lsp = require("project").lsp()

            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = { globals = { "vim" } },
                        workspace = {
                            checkThirdParty = false,
                            library = { vim.env.VIMRUNTIME },
                        },
                        telemetry = { enable = false },
                    },
                },
            })

            for name, cfg in pairs(lsp.config) do
                vim.lsp.config(name, cfg)
            end

            vim.lsp.enable({ "jsonls", "yamlls", "taplo", "lemminx", "lua_ls" })
            vim.lsp.enable(lsp.enable)
        end,
    },
}
