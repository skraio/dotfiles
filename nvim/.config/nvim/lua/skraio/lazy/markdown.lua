return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },

    build = function()
        vim.fn["mkdp#util#install"]()
    end,

    init = function()
        local g = vim.g
        g.mkdp_auto_start = 0
    end,

    config = function()
        local function get_first_line()
            local first_line = vim.fn.getline(1)
            return first_line:gsub('#%s*', '') -- Remove the '# ' from the title
        end

        -- Set the page title when opening a file
        vim.api.nvim_create_autocmd("BufEnter", {
            callback = function()
                vim.g.mkdp_page_title = get_first_line()
            end,
        })

        vim.g.mkdp_auto_close = 0
        vim.g.mkdp_combine_preview = 0

        vim.g.mkdp_theme = 'dark'

        vim.keymap.set("n", "<leader>mp", function() vim.cmd("MarkdownPreview") end)
    end,
}
