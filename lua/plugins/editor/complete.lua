return {
    "saghen/blink.cmp",
    version = "1.10.2",
    dependencies = {
        "rafamadriz/friendly-snippets",
        "saghen/blink.compat",
    },
    lazy = true,
    event = { "BufReadPre", "BufNewFile", "InsertEnter", "CmdlineEnter" },
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
            ["<S-Tab>"] = {
                function(cmp)
                    if cmp.is_visible() then
                        return cmp.select_prev()
                    elseif cmp.snippet_active() then
                        return cmp.snippet_backward()
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
                    enabled = true,
                },
            },
            menu = {
                enabled = true,
                border = "rounded",
                auto_show = function(ctx)
                    local buf = vim.api.nvim_get_current_buf()
                    local bt = vim.bo[buf].buftype
                    local ft = vim.bo[buf].filetype
                    -- 只在正常文件 buffer 中显示：不是特殊 buftype，有文件类型，且已列入 buffer 列表
                    return bt == "" and ft ~= "" and vim.bo[buf].buflisted
                end,
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
                "lsp", "path", "snippets", "buffer"
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
                ["<Tab>"] = { "show", "select_next", "fallback" },
                ["<S-Tab>"] = { "select_prev", "fallback" },
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
                    auto_show = function(ctx)
                        return vim.fn.getcmdtype() == ':'
                    end,
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
    end,
}
