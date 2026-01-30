return {
    "tsurumi-yizhou/nvim-lspconfig",
    lazy = true,
    event = "VeryLazy",
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
        { "<leader>gc", "<CMD>LspInfo<CR>",          desc = "Check Lsp Info" }
    },
}
