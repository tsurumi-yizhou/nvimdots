return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    lazy = false,
    config = function()
        local treesitter = require("nvim-treesitter")
        treesitter.setup({})
        treesitter.install({ "lua", "markdown", "markdown_inline", "vimdoc" })
        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
            callback = function(event)
                -- Other languages can be installed with :TSInstall <language>.
                local lang = vim.treesitter.language.get_lang(vim.bo[event.buf].filetype)
                if lang and vim.treesitter.language.add(lang) then
                    vim.treesitter.start(event.buf, lang)
                end
            end,
        })
    end,
}
