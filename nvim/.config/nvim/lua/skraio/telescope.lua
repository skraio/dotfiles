local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fd', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})

vim.keymap.set('n', '<leader>sd',
function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end
)

local actions = require("telescope.actions")
require("telescope").setup{
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = "",
            },
        },
    },
}
