return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },             -- Required
        { 'williamboman/mason.nvim' },           -- Optional
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },     -- Required
        { 'hrsh7th/cmp-nvim-lsp' }, -- Required
        { 'L3MON4D3/LuaSnip' },     -- Required
    },

    config = function()

        local lsp = require('lsp-zero').preset({})
        local cmp = require('cmp')

        vim.g.diagnostics_visible = true

        cmp.setup.filetype({"sql"},{
            sources = {
                { name = "vim-dadbod-completion"},
                { name = "buffer"},
            },
        })

        lsp.on_attach(function(client, bufnr)
            local opts = {buffer = bufnr, remap = false}
            vim.keymap.set("n", "<leader>td",
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
            vim.keymap.set("n", "]d",  vim.diagnostic.goto_next, opts)
            vim.keymap.set("n", "[d",  vim.diagnostic.goto_prev, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<leader>vd",  vim.diagnostic.open_float, opts)
            vim.keymap.set("n", "gd",  vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, opts)
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
            vim.keymap.set("n", "<leader>orr", vim.lsp.buf.references, opts)
            vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "<leader>fmt", vim.lsp.buf.format, opts)
            vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
        end)

        lsp.ensure_installed({
            "pylsp",
            "gopls",
            "clangd",
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
            on_attach = on_attach,
        })

        -- clangd client configuration
        require('lspconfig').clangd.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
        function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
            opts = opts or {}
            opts.border = opts.border or 'single'
            opts.max_width = opts.max_width or 80
            return orig_util_open_floating_preview(contents, syntax, opts, ...)
        end
    end
}
