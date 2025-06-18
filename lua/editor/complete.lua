return {
    {
        "zbirenbaum/copilot.lua",
        lazy = true,
        event = "BufWritePost",
        opts = {
            suggestion = { enabled = false },
            panel = { enabled = false },
        }
    },
    {
        "saghen/blink.cmp",
        version = "1.*",
        dependencies = {
            "rafamadriz/friendly-snippets",
            "giuxtaposition/blink-cmp-copilot",
        },
        lazy = true,
        event = "User IceLoad",
        opts = {
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
                    window = {
                        border = "rounded",
                    }
                },
                menu = {
                    border = "rounded",
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
                    "lsp", "path", "buffer", "copilot"
                },
                providers = {
                    copilot = {
                        name = "copilot",
                        module = "blink-cmp-copilot",
                        score_offset = 100,
                        async = true,
                    },
                }
            },
        },
        config = function(_, opts)
            require("blink.cmp").setup(opts)
            vim.lsp.config("*", {
                capabilities = require('blink.cmp').get_lsp_capabilities()
            })
        end,
        keys = {
            { "<leader>gD", vim.lsp.buf.declaration },
            { "<leader>gd", vim.lsp.buf.definition },
            { "<leader>K",  vim.lsp.buf.hover },
            { "<leader>gi", vim.lsp.buf.implementation },
            { "<leader>rn", vim.lsp.buf.rename },
            { "<leader>gr", vim.lsp.buf.references },
            { "<leader>ca", vim.lsp.buf.code_action },
            { "<leader>F",  vim.lsp.buf.format },
        }
    }
}
