return {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
        "rafamadriz/friendly-snippets"
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
                }
            },
        }
        vim.lsp.config("*", {
            capabilities = require('blink.cmp').get_lsp_capabilities()
        })
    end
}