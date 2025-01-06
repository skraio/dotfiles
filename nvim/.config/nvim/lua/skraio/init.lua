require("skraio.set")
require("skraio.remap")
require("skraio.lazy_init")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({ "BufWritePre" }, {
    pattern = "*",
    command = [[%s/\s\+$//e]],
})


autocmd('LspAttach', {
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "<leader>td",
            function()
                if vim.g.diagnostics_visible then
                    vim.g.diagnostics_visible = false
                    vim.diagnostic.disable()
                else
                    vim.g.diagnostics_visible = true
                    vim.diagnostic.enable()
                end
            end, opts)

        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts, {desc = "LSP: hover"})
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts, {desc = "LSP: signature_help"})
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)

        vim.keymap.set("n", "<leader>hl", function() vim.lsp.buf.document_highlight() end, opts, {desc = "LSP: document highligh"})
        vim.keymap.set("n", "<leader>cl", function() vim.lsp.buf.clear_references() end, opts, {desc = "LSP: clear references"})

        vim.keymap.set("n", "<leader>fmt", function() vim.lsp.buf.format() end, opts, {desc = "LSP: format"})
        vim.keymap.set({ "n", "v" }, "<leader>ca", function() vim.lsp.buf.code_action() end, opts, {desc = "LSP: code action"})
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts, {desc = "LSP: rename"})


        vim.keymap.set("n", "gd", function()
            vim.lsp.buf.definition()
        end, opts, {desc = "LSP: definition"})
        vim.keymap.set("n", "gD", function()
            vim.cmd("tab split")
            vim.lsp.buf.definition()
        end, opts, {desc = "LSP: definition in new tab"})

        vim.keymap.set("n", "<leader>ref", function() vim.lsp.buf.references() end, opts, {desc = "LSP: references"})
        vim.keymap.set("n", "<leader>ii", function() vim.lsp.buf.implementation() end, opts, {desc = "LSP: implementation"})

        vim.keymap.set("n", "<leader>ic", function() vim.lsp.buf.incoming_calls() end, opts, {desc = "LSP: incoming calls"})
        vim.keymap.set("n", "<leader>oc", function() vim.lsp.buf.outgoing_calls() end, opts, {desc = "LSP: outgoing calls"})
    end
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
