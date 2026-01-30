return {
    "saghen/blink.cmp",
    version = "1.8.0",
    dependencies = {
        "rafamadriz/friendly-snippets",
        "saghen/blink.compat",
    },
        lazy = true,
        event = "BufReadPre",
        opts = {
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
            completion = {
                keyword = {
                    range = "full",
                },
                trigger = {
                    prefetch_on_insert = true,
                    show_in_snippet = false,
                    show_on_insert = true,
                },
                list = {
                    selection = {
                        preselect = true,
                        auto_insert = true,
                    }
                },
                accept = {
                    create_undo_point = true,
                    auto_brackets = {
                        enabled = false,
                    },
                },
                menu = {
                    enabled = true,
                    border = "rounded",
                    auto_show = true,
                },
                documentation = {
                    auto_show = true,
                    window = {
                        border = "rounded",
                    },
                },
                ghost_text = {
                    enabled = false,
                },
            },
            fuzzy = {
                implementation = "prefer_rust",
                frecency = {
                    enabled = true,
                    unsafe_no_lock = true
                },
                prebuilt_binaries = {
                    download = true,
                    ignore_version_mismatch = true,
                }
            },
            sources = {
                default = {
                    "lsp", "path", "snippets", "buffer", "avante"
                },
                providers = {
                    avante = {
                        module = "blink.compat.source",
                        name = "avante",
                        opts = {},
                    },
                },
            },
            snippets = {
                expand = function(snippet) vim.snippet.expand(snippet) end,
                active = function(filter) return vim.snippet.active(filter) end,
                jump = function(direction) vim.snippet.jump(direction) end,
            },
            signature = {
                enabled = true,
                trigger = {
                    enabled = true,
                    show_on_insert = true,
                    show_on_accept = true,
                },
                window = {
                    border = "rounded",
                    show_documentation = true,
                }
            },
            appearance = {
                use_nvim_cmp_as_default = false,
                nerd_font_variant = "mono",
            },
            cmdline = {
                enabled = true,
                keymap = {
                    preset = "cmdline",
                },
                sources = {
                    "buffer", "path", "cmdline",
                },
                completion = {
                    list = {
                        selection = {
                            preselect = true,
                            auto_insert = true,
                        },
                    },
                    menu = {
                        auto_show = true,
                    },
                    ghost_text = {
                        enabled = true,
                    },
                }
            },
            term = {
                enabled = true,
                keymap = {
                    preset = "inherit",
                },
            },
        },
        config = function(_, opts)
            require("blink.cmp").setup(opts)
            vim.lsp.config("*", {
                capabilities = require('blink.cmp').get_lsp_capabilities()
            })
        end,
}
