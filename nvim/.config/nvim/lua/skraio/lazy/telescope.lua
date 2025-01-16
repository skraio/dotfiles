return {
    "nvim-telescope/telescope.nvim",

    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        require('telescope').setup({
            defaults = {
                layout_strategy = 'flex',
                sorting_strategy = 'ascending',
                layout_config = {
                    prompt_position = 'top',
                },
            }
        })
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>fr', builtin.resume, {})
        vim.keymap.set('n', '<leader>fd', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fc', "<cmd>Telescope find_files search_dirs=%:h<cr>", {})
        vim.keymap.set('n', '<leader>fh',
            "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--ignore', '--hidden', '--files', '-u', '-g', '!.git'}})<cr>",
            {})
        vim.keymap.set('n', '<leader>fg', builtin.git_files, {})

        vim.keymap.set('n', '<leader>sw', builtin.grep_string, {})
        vim.keymap.set('n', '<leader>sW', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>sl', builtin.live_grep, {})

        vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = "Telescope: Show help tags" })
    end

}
