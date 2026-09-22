return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "mfussenegger/nvim-dap",
        },
        cmd = "Neotest",
        keys = {
            { "<leader>Tn", function() require("neotest").run.run() end, desc = "Run Nearest Test" },
            { "<leader>Tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File Tests" },
            { "<leader>Td", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Debug Nearest Test" },
            { "<leader>Ts", function() require("neotest").summary.toggle() end, desc = "Toggle Test Summary" },
            { "<leader>To", function() require("neotest").output_panel.toggle() end, desc = "Toggle Test Output" },
        },
        config = function()
            local project = require("project")
            local adapters = {
                { key = "rust",   repo = "rouge8/neotest-rust",         mod = "neotest-rust" },
                { key = "python", repo = "nvim-neotest/neotest-python", mod = "neotest-python" },
                { key = "ctest",  repo = "orjangj/neotest-ctest",       mod = "neotest-ctest" },
                { key = "dotnet", repo = "Issafalcon/neotest-dotnet",   mod = "neotest-dotnet" },
                { key = "vitest", repo = "marilari88/neotest-vitest",   mod = "neotest-vitest" },
                { key = "kotlin", repo = "codymikol/neotest-kotlin",    mod = "neotest-kotlin" },
            }

            -- project.nvim 的 test provider：按 .nvim/project.json 的 test.adapters
            -- 筛选本机可用的 neotest adapter 并完成 setup。未声明时全选。
            local installed = false
            local function provider(model)
                if installed then
                    return
                end
                local declared = model.test and model.test.adapters or nil

                local list = {}
                for _, a in ipairs(adapters) do
                    local opts = project.enabled(declared, a.key)
                    if opts then
                        require("lazy").load({ plugins = { a.repo } })
                        local adapter = require(a.mod)
                        list[#list + 1] = (opts ~= true and vim.is_callable(adapter)) and adapter(opts) or adapter
                    end
                end
                require("neotest").setup({ adapters = list })
                installed = true
            end
            require("project").register("test", provider)
        end,
    },
    { "rouge8/neotest-rust", lazy = true },
    { "nvim-neotest/neotest-python", lazy = true },
    { "orjangj/neotest-ctest", lazy = true },
    { "Issafalcon/neotest-dotnet", lazy = true },
    { "marilari88/neotest-vitest", lazy = true },
    { "codymikol/neotest-kotlin", lazy = true },
}
