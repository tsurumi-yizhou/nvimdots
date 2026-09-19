return {
    "3rd/image.nvim",
    build = false,
    ft = { "markdown" },
    event = {
        "BufReadPre *.png,*.jpg,*.jpeg,*.gif,*.webp,*.avif",
        "BufNewFile *.png,*.jpg,*.jpeg,*.gif,*.webp,*.avif",
    },
    cmd = { "ImageReport" },
    opts = {
        -- Windows Terminal uses Sixel; other terminals can use Kitty graphics.
        backend = vim.env.WT_SESSION and "sixel" or "kitty",
        processor = "magick_cli",
        integrations = {
            markdown = {
                enabled = true,
                filetypes = { "markdown" },
                clear_in_insert_mode = true,
                download_remote_images = true,
                -- Limit Sixel redraws while navigating long documents.
                only_render_image_at_cursor = true,
                only_render_image_at_cursor_mode = "popup",
            },
            asciidoc = { enabled = false },
            neorg = { enabled = false },
            rst = { enabled = false },
            typst = { enabled = false },
        },
        max_width_window_percentage = 90,
        max_height_window_percentage = 50,
        hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
    },
}
