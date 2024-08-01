return {
    "tpope/vim-fugitive",
    config = function ()
        vim.keymap.set("n", "<leader>Gs", vim.cmd.Git)
        vim.keymap.set("n", "<leader>Gd", vim.cmd.Gdiffsplit)
    end
}
