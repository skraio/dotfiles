return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>Gh", ":0GcLog<CR>", {desc = "Fugitive: quckfix list of commits for current file"})
        vim.keymap.set("n", "<leader>Gds", "<cmd>Gdiffsplit!<cr>", { desc = "Fugitive: diffsplit current buffer" })
        vim.keymap.set("n", "<leader>Gl", "<cmd>tab G log --oneline<cr>", { desc = "Fugitive: 'git log --oneline' in new tab" })
        vim.keymap.set("n", "<leader>Gd1", "<cmd>G difftool -y HEAD~1<cr>", { desc = "Fugitive: difftool with HEAD~1" })
        vim.keymap.set("n", "<leader>Gd0", "<cmd>G difftool -y<cr>", { desc = "Fugitive: difftool with HEAD" })
    end
}
