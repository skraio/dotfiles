return {
    "mbbill/undotree",

    config = function()
        vim.g.undotree_SetFocusWhenToggle = true
        vim.keymap.set("n", "<leader>ut", function()
            vim.cmd.UndotreeToggle()
        end, { desc = "Toggle Undotree" })
    end
}
