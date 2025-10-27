return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons", -- optional, but recommended
        },
        lazy = false,                      -- neo-tree will lazily load itself

        config = function()
            require('neo-tree').setup({
                enable_git_status = false,
                mappings = {
                    ["<C-f>"] = "none",
                }
            })
        end
    }
}
