return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
    config = function()
        require('render-markdown').setup({
            enabled=false,
            code = {
                sign = false,
                width = 'block',
            },
            heading = {
                width = 'block',
                min_width = 100,
            },
            dash = {
                width = 100,
            },
        })
        vim.keymap.set("n", "<leader>rt", "<CMD>RenderMarkdown toggle<CR>")
    end
}
