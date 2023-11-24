local lsp = require('lsp-zero').preset({})

vim.g.diagnostics_visible = true

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}
    vim.keymap.set("n", "<leader>wt",
        function()
          if vim.g.diagnostics_visible then
            vim.g.diagnostics_visible = false
            vim.diagnostic.disable()
          else
            vim.g.diagnostics_visible = true
            vim.diagnostic.enable()
          end
        end
    , opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
end)

lsp.ensure_installed({
	"pylsp",
})

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
lsp.setup()
