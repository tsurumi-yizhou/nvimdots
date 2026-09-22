vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
    callback = function(event)
        local lang = vim.treesitter.language.get_lang(vim.bo[event.buf].filetype)
        if not lang or not vim.tbl_contains(require("nvim-treesitter.config").get_available(), lang) then
            return
        end
        if vim.treesitter.language.add(lang) then
            vim.treesitter.start(event.buf, lang)
        else
            require("nvim-treesitter").install(lang):await(function()
                vim.schedule(function()
                    if vim.api.nvim_buf_is_valid(event.buf) and vim.treesitter.language.add(lang) then
                        vim.treesitter.start(event.buf, lang)
                    end
                end)
            end)
        end
    end,
})


return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    event = { "BufReadPre", "BufNewFile" },
}
