return {
    {
        'projekt0n/github-nvim-theme'
    },
    {
        "rebelot/kanagawa.nvim",
        config = function()
            require('kanagawa').setup({
                commentStyle = { italic = false },
                keywordStyle = { italic = false },
                background = {
                    dark = "dragon",
                },
                colors = {
                    palette = {
                        -- change all usages of these colors
                        dragonViolet = "#938AA9",
                        dragonBlue2 = "#80a4b0",

                        -- Fg and Comments
                        oldWhite = "#c5c9c5",
                    },
                },
            })
            vim.cmd("colorscheme kanagawa")
        end,
    }
}
