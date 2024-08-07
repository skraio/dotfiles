-- vim.keymap.set("n", "<leader>fe", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz^")
vim.keymap.set("n", "<C-u>", "<C-u>zz^")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("x", ">", ">gv")
vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", "Ю", ">gv")
vim.keymap.set("x", "Б", "<gv")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<cr>")

vim.keymap.set("i", "<C-u>", "")
vim.keymap.set("i", "<C-w>", "")

vim.keymap.set("n", "Э+нн", "\"+yy")
vim.keymap.set("v", "Э+н", "\"+y")
vim.keymap.set("n", "Э+з", "\"+p")
vim.keymap.set("v", "Э+з", "\"+p")

vim.keymap.set("v", "<leader>`", "c``<esc>P")

vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<C-h>", "<cmd>cfirst<CR>zz")

vim.keymap.set("n", "<C-w>o", "<C-w>ozz")
