return {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
        -- add options here
        -- or leave it empty to use the default settings
        --
        default = {
            -- file and directory options
            relative_to_current_file = true,
            dir_path = function()
                return "asset-imgs"
            end,
        }
    },
    keys = {
        -- suggested keymap
        -- { "<leader>pi", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
}
