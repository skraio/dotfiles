local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fd', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})

vim.keymap.set('n', '<leader>sd',
function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end
)

vim.keymap.set('n', '<leader>trr', builtin.lsp_references)
vim.keymap.set('n', '<leader>tvd', builtin.diagnostics)
vim.keymap.set('n', '<leader>tgc', builtin.git_commits)
vim.keymap.set('n', '<leader>tgs', builtin.git_status)
