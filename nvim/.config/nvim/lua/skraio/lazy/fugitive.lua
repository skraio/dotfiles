return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>Gl", "<cmd>tab G log<cr>", { desc = "Fugitive: 'git log --oneline' in new tab" })
        vim.keymap.set("n", "<leader>Gb", "<cmd>G blame<cr>", { desc = "Fugitive: 'git blame' for current file" })
    end
}
