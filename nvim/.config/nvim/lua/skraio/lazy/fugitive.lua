return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gw", function ()
            vim.cmd("G blame --date=short")
        end, { desc = "Fugitive: Git blame for current file" })
    end
}
