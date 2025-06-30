local path = vim.fs.joinpath(".nvim", "build.json")
local tasks = {}
if vim.fn.filereadable(path) then
    local file = io.open(path, "r")
    --- @diagnostic disable-next-line: need-check-nil
    local content = file:read("a")
    --- @diagnostic disable-next-line: need-check-nil
    file:close()
    local success, json = pcall(vim.json.decode, content)
    if success then
        tasks = json.tasks
    else
        vim.notify_once("Failed to decode build.json")
    end
end

return {
    "stevearc/overseer.nvim",
    lazy = true,
    keys = {
        { "<leader>b", "<CMD>OverseerRun<CR>", "Run Tasks" }
    },
    opts = {
        strategy = "toggleterm",
        auto_detect_success_color = true,
        task_list = {
            direction = "right",
        },
        actions = {},
        form = {
            border = "rounded",
        }
    },
    config = function(_, opts)
        local overseer = require("overseer")
        overseer.setup(opts)

        for _, task in ipairs(tasks) do
            overseer.register_template {
                name = task.name,
                builder = function()
                    return {
                        cmd = task.cmd,
                        env = task.env or {},
                        cwd = task.cwd or vim.fn.getcwd(),
                        components = task.components or { "default" },
                        output_file = task.output_file,
                    }
                end
            }
        end
    end
}
