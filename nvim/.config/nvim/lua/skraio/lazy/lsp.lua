return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-cmdline" },
        { "hrsh7th/nvim-cmp" },
        { "L3MON4D3/LuaSnip" },
        { "saadparwaiz1/cmp_luasnip" },
    },

    config = function()
        local cmp = require('cmp')
        cmp.setup.filetype({ "sql" }, {
            sources = {
                { name = "vim-dadbod-completion" },
                { name = "buffer" },
            },
        })

        require("mason").setup()

        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "pylsp",
                "clangd",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,
            }
        })

        -- require("go").setup()
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },

            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-o>"] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.close(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })

        -- toggle autocomplete
        vim.g.autocomplete_enabled = true

        -- require('cmp').setup({
        --     enabled = function() return vim.g.autocomplete_enabled end,
        -- })

        vim.keymap.set("n", "<leader>ta",
            function()
                if vim.g.autocomplete_enabled then
                    vim.g.autocomplete_enabled = false
                    require('cmp').setup({
                        enabled = function() return false end,
                    })
                    print("Autocomplete Disabled")
                else
                    vim.g.autocomplete_enabled = true
                    require('cmp').setup({
                        enabled = function() return true end,
                    })
                    print("Autocomplete Enabled")
                end
            end, { noremap = true, silent = true })


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
            opts.border = opts.border or 'rounded'
            opts.max_width = opts.max_width or 80
            return orig_util_open_floating_preview(contents, syntax, opts, ...)
        end
    end
}
