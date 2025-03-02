return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
    config = function()
        require('render-markdown').setup({
            code = {
                width = 'block',
                min_width = 100,
                sign = false,
            },
            heading = {
                width = 'block',
                min_width = 100,
                -- icons = { " "},
            },
            dash = {
                width = 100,
            },
        })
    end
}
