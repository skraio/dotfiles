return {
    {
        "kristijanhusak/vim-dadbod-ui",
        dependencies = {
            { "tpope/vim-dadbod",                     lazy = true },
            { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
        },
        cmd = {
            "DBUI",
            "DBUIToggle",
            "DBUIAddConnection",
            "DBUIFindBuffer",
        },
        init = function()
            vim.g.db_ui_win_position = "right"
            vim.g.db_ui_execute_on_save = 0
            vim.g.db_ui_use_nerd_fonts = 1
            vim.g.db_ui_force_echo_notifications = 1

            vim.api.nvim_create_autocmd("filetype", {
                pattern = "dbout",
                callback = function()
                    vim.wo.foldenable = false
                end
            })

            vim.keymap.set("n", "<leader>Db", function()
                vim.cmd.tabnew()
                vim.cmd.DBUIToggle()
            end)
        end,
    },
}
