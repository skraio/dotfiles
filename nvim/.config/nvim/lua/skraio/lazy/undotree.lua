return {
    "mbbill/undotree",

    config = function ()
        vim.g.undotree_SetFocusWhenToggle = true
        vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle)
    end
}
