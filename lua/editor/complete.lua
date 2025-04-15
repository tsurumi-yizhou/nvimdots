return {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
        "rafamadriz/friendly-snippets",
        "giuxtaposition/blink-cmp-copilot"
    },
    config = function()
        require("blink.cmp").setup {
            appearance = {
                use_nvim_cmp_as_default = false,
                nerd_font_variant = "mono",
            },
            completion = {
                accept = {
                    auto_brackets = {
                        enabled = true,
                    },
                },
                documentation = {
                    auto_show = true,
                },
                menu = {
                    draw = {
                        treesitter = { "lsp" },
                    },
                },
            },
            cmdline = {
                completion = {
                    ghost_text = {
                        enabled = true,
                    },
                },
            },
            fuzzy = {
                implementation = "prefer_rust",
            },
            keymap = {
                preset = "enter",
                ["<Tab>"] = {
                    function(cmp)
                        if cmp.is_visible() then
                            return cmp.select_next()
                        elseif cmp.snippet_active() then
                            return cmp.snippet_forward()
                        else
                            return false
                        end
                    end,
                    "fallback",
                },
            },
            sources = {
                default = {
                    "lsp", "path", "buffer"
                },
            },
        }
        vim.lsp.config("*", {
            capabilities = require('blink.cmp').get_lsp_capabilities()
        })
        vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration)
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
        vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover)
        vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
        vim.keymap.set("n", "<leader>F", vim.lsp.buf.format)
    end
}
