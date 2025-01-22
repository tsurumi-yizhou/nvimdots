local setup_lua = function (env)
    vim.notify_once("Enable Lua")    
    vim.opt.syntax = 'on'
    vim.opt.number = true
    vim.opt.tabstop = 4       
    vim.opt.shiftwidth = 4   
    vim.opt.softtabstop = 4  
    vim.opt.expandtab = true 
    vim.opt.autoindent = true
    vim.opt.smartindent = true

    require("lspconfig").lua_ls.setup {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        keys = {
            { 'gf', vim.lsp.buf.declaration },
            { 'gd', vim.lsp.buf.definition },
            { 'K', vim.lsp.buf.hover },
            { 'gi', vim.lsp.buf.implementation },
            { '<leader>rn', vim.lsp.buf.rename },
            { '<leader>ca', vim.lsp.buf.code_action }
        },
        cmd = {
            "lua-language-server",
            "--logpath=" .. vim.fn.stdpath("data") .. "/lua-language-server",
            "--metapath=" .. vim.fn.stdpath("data") .. "lua-language-server",
            "--root-path=" .. vim.fn.stdpath("data") .. "/lua-language-server",
            "--settings=" .. vim.fn.stdpath("data") .. "lua-language-server",
        },
	    on_init = function(client)
	        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                runtime = {
		            version = 'LuaJIT'
                },
           	    workspace = {
                    checkThirdParty = false,
                    library = {
                        vim.env.VIMRUNTIME
        	        }
                }
      	    })
	    end,
	    settings = {
	        Lua = {}
	    }
    }
end

vim.g.lua = {
    setup = setup_lua
}

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.lua"},
  callback = setup_lua
})

return {}
