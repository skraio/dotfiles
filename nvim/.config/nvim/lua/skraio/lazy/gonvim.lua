return {
    {
        "ray-x/go.nvim",
        dependencies = {
            "ray-x/guihua.lua",                -- Optional
            "nvim-treesitter/nvim-treesitter", -- Optional
        },
        config = function()
            require("go").setup({

                comment_placeholder = "TODO",
                icons = false,
                lsp_inlay_hints = {
                    enable = false,
                },
            })
        end,

        event = { "CmdlineEnter" },
        ft = { "go", "gomod" },
        build = ':lua require("go.install").update_all_sync()' -- Install/update all binaries
    },
}
