local setup_cmake = function()
    local splitter = package.config:sub(1, 1)
    require("cmake-tools").setup {
        cmake_command = "cmake",
        ctest_command = "ctest",
        cmake_use_preset = false,
        cmake_regenerate_on_save = true,
        cmake_build_directory = "build",
        cmake_soft_link_compile_commands = false,
        cmake_compile_commands_from_lsp = true,
        cmake_kits_path = "~" .. splitter .. ".cmake" .. splitter .. "kits.json",
        cmake_variants_message = {
            short = { show = true },
            long = { show = true, max_length = 40 },
        },
        cmake_dap_configuration = {
            name = "cpp",
            type = "lldb",
            request = "launch",
            stopOnEntry = false,
            runInTerminal = true,
            console = "integratedTerminal",
        },
        cmake_virtual_text_support = true,
        cmake_notifications = {
          runner = { enabled = true },
          executor = { enabled = true },
          spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
          refresh_rate_ms = 100,
        },
    }
    vim.g.cpp.setup()
end

vim.api.nvim_create_autocmd({"BufWinEnter"}, {
    callback = function()
        local cwd = vim.fn.getcwd()
        local splitter = package.config:sub(1, 1)
        if vim.fn.glob(cwd .. splitter .. "CMakeLists.txt") ~= "" then
            setup_cmake()
        end
    end
})

return {
    {
        'Civitasv/cmake-tools.nvim',
        keys = {
            { '<leader>cg', 'CMakeGenerate<CR>' },
            { '<leader>cb', 'CMakeBuild<CR>' },
            { '<leader>ct', 'CMakeTest<CR>' },
            { '<leader>cr', 'CMakeRun<CR>' },
            { '<leader>cd', 'CMakeDebug<CR>' }
        }
    }
}
