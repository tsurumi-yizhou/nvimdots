return {
    "stevearc/aerial.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "DaikyXendo/nvim-material-icon",
    },
    cmd = { "AerialToggle", "AerialOpen", "AerialClose" },
    keys = {
        { "<leader>o", "<CMD>AerialToggle<CR>", desc = "Toggle Outline" },
    },
    opts = {
        -- 有 LSP 优先 LSP（kind 与层级更准），未 attach 时先落 treesitter，
        -- LSP attach 后 aerial 会自动切换接管；专用后端补回 markdown/asciidoc/man
        backends = {
            ["_"] = { "lsp", "treesitter" },
            markdown = { "markdown", "treesitter" },
            asciidoc = { "asciidoc" },
            man = { "man" },
        },
        -- 默认是 8 种符号的白名单（Constant/Field/EnumMember 等都被隐藏），改为全量
        filter_kind = false,
        layout = {
            min_width = 24,
            max_width = { 40, 0.25 },
            default_direction = "prefer_right",
        },
        -- 跟随当前窗口，而不是固定显示打开时那个窗口的符号
        attach_mode = "global",
        lazy_load = true,
        autojump = true,
        show_guides = true,
        highlight_on_hover = true,
        nerd_font = true,
    },
}
