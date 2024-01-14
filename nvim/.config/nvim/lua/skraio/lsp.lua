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
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', 'gs', function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
end)

lsp.ensure_installed({
	"pylsp",
    "gopls",
})

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
lsp.setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- This line disables snippets. Note that disabling snippets has side-effects
-- like not including parens on autocomplete.
capabilities.textDocument.completion.completionItem.snippetSupport = false

-- gopls client configuration.
require('lspconfig').gopls.setup({
	capabilities = capabilities,
	on_attach = codeNavigationBindings,
})
