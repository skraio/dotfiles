return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>Gl", function()
            vim.cmd("tab G log")
        end, { desc = "Fugitive: Git log (oneline) in new tab" })

        vim.keymap.set("n", "<leader>Gb", function()
            vim.cmd("G blame")
        end, { desc = "Fugitive: Git blame for current file" })
    end
}
