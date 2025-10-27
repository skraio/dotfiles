-- vim.keymap.set("n", "<leader>fe", vim.cmd.Ex)

vim.keymap.set({ "n", "v"}, "<leader>y", "\"+y")
vim.keymap.set({ "n", "v"}, "<leader>p", "\"+p")
vim.keymap.set("x", "<leader><leader>p", "\"_dP")
vim.keymap.set({ "n", "v"}, "<leader>Y", "\"+y$")
vim.keymap.set({ "n", "v"}, "<leader>P", "\"+P")
vim.keymap.set({"v"}, "<leader>d", "\"_d")
vim.keymap.set({"v"}, "<leader>x", "\"+x")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set({ "n", "x" }, "j", function()
  return vim.v.count > 5 and "m'" .. vim.v.count .. "j" or "j"
end, { noremap = true, expr = true })

vim.keymap.set({ "n", "x" }, "k", function()
  return vim.v.count > 5 and "m'" .. vim.v.count .. "k" or "k"
end, { noremap = true, expr = true })

vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", ">", ">gv")
vim.keymap.set("x", "<", "<gv")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<cr>")

vim.keymap.set("i", "<C-u>", "")
vim.keymap.set("i", "<C-w>", "")

vim.keymap.set("n", "dd", "")
vim.keymap.set("n", "yy", "")

vim.keymap.set("v", "<leader>`", "c``<esc>P")
vim.keymap.set("n", "<leader>`", "viWc``<esc>P")

vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")

vim.keymap.set("n", "<C-w>o", "<C-w>ozz")
vim.keymap.set("n", "<C-w>N", "<cmd>rightb vnew<CR>")

vim.keymap.set("n", "<leader>sfs", "<cmd>set foldmethod=syntax<cr>", { desc = "set foldmethod" })

vim.keymap.set("n", "\"i", vim.cmd.reg, { desc = "" })

-- vim.keymap.set("n", "<leader>xg", "<cmd>!go run %<cr>")
vim.keymap.set("n", "<leader>xg", function ()
    vim.cmd("write")
    local file = vim.fn.expand("%:p")
    vim.cmd("belowright 15split | terminal go run " .. file)
end)


vim.keymap.set("n", "<leader>xb", function ()
    vim.cmd("write")
    local file = vim.fn.expand("%:p")
    vim.cmd("belowright 15split | terminal bash " .. file)
    -- vim.cmd("!bash %")
end)

vim.keymap.set("n", "<leader>xp", function ()
    vim.cmd("write")
    local file = vim.fn.expand("%:p")
    vim.cmd("belowright 15split | terminal python " .. file)
    -- vim.cmd("!python %")
end)

vim.keymap.set("n", "<leader>GC", function ()
    vim.cmd("Gwrite")
    vim.cmd("G commit")
end)

vim.keymap.set("n", "<leader>GF", function ()
    -- vim.cmd("bufdo if &modified | update | Gwrite | endif")
    vim.cmd("silent! wa")
    vim.cmd("silent! G add .")
    vim.cmd("silent! G commit -m 'upd'")
    vim.cmd("silent! G push")
end)

vim.keymap.set("n", "<CR>", function()
  ---@diagnostic disable-next-line: undefined-field
  if vim.v.hlsearch == 1 then
    vim.cmd.nohl()
    return ""
  else
    return vim.keycode "<CR>"
  end
end, { expr = true })

vim.keymap.set("n", "<left>", "gT")
vim.keymap.set("n", "<right>", "gt")

vim.keymap.set("n", "j", function(...)
  local count = vim.v.count

  if count == 0 then
    return "gj"
  else
    return "j"
  end
end, { expr = true })

vim.keymap.set("n", "k", function(...)
  local count = vim.v.count

  if count == 0 then
    return "gk"
  else
    return "k"
  end
end, { expr = true })


vim.keymap.set({"v"}, "<leader>B", function ()
    vim.cmd('normal! y')
    local decoded = vim.fn.system("base64 --decode", vim.fn.getreg('"'))
    vim.cmd("belowright split")
    vim.cmd("enew")
    vim.bo.buftype = "nofile"
    vim.bo.bufhidden = "wipe"
    vim.bo.swapfile = false
    vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(decoded, "\n"))
end)

vim.keymap.set({"n"}, "<leader>B", function ()
    local WORD = vim.fn.expand("<cWORD>")
    local decoded = vim.fn.system("base64 --decode", WORD)
    vim.cmd("belowright split")
    vim.cmd("enew")
    vim.bo.buftype = "nofile"
    vim.bo.bufhidden = "wipe"
    vim.bo.swapfile = false
    vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(decoded, "\n"))
end)
