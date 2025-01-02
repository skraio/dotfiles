return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>Gdf", "<cmd>Gdiffsplit!<cr>")
        vim.keymap.set("n", "<leader>Gl", "<cmd>tab G log<cr>")
        vim.keymap.set("n", "<leader>Gdh", "<cmd>G difftool -y HEAD~1<cr>")
        vim.keymap.set("n", "<leader>sfs", "<cmd>set foldmethod=syntax<cr>")
    end
}
