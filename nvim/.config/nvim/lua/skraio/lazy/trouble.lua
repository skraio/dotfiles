local keys = {
    {
        "<leader>ld",
        function()
            require("trouble").toggle({ mode = "diagnostics", filter = { buf = 0 } })
        end,
        desc = "Trouble: Buffer Diagnostics",
        mode = "n",
    },
    {
        "<leader>lD",
        function()
            require("trouble").toggle({ mode = "diagnostics" })
        end,
        desc = "Trouble: Workspace Diagnostics",
        mode = "n",
    },
    {
        "<leader>lq",
        function()
            require("trouble").close()
        end,
        desc = "Trouble: Close",
        mode = "n",
    },
    {
        "]t",
        function()
            local trouble = require("trouble")
            if not trouble.is_open() then
                trouble.open({ mode = "diagnostics" })
            else
                trouble.next({ skip_groups = true, jump = true })
            end
        end,
        desc = "Trouble: Next Diagnostic",
        mode = "n",
    },
    {
        "[t",
        function()
            local trouble = require("trouble")
            if not trouble.is_open() then
                trouble.open({ mode = "diagnostics" })
            else
                trouble.prev({ skip_groups = true, jump = true })
            end
        end,
        desc = "Trouble: Previous Diagnostic",
        mode = "n",
    },
    -- {
    --     "<leader>lts",
    --     function()
    --         vim.cmd("Trouble symbols toggle focus=false win.position=right win.size.width=42")
    --     end,
    --     desc = "Trouble: Document Symbols",
    --     mode = "n",
    -- },
    -- {
    --     "<leader>ll",
    --     function()
    --         vim.cmd("Trouble lsp toggle focus=false win.position=right win.size.width=48")
    --     end,
    --     desc = "Trouble: LSP Definitions, References, etc.",
    --     mode = "n",
    -- },
    -- {
    --     "<leader>lgd",
    --     function()
    --         vim.cmd("Trouble lsp_definitions toggle focus=false win.position=bottom")
    --     end,
    --     desc = "Trouble: LSP Definitions",
    --     mode = "n",
    -- },
    -- {
    --     "<leader>lgi",
    --     function()
    --         vim.cmd("Trouble lsp_implementations toggle focus=false win.position=bottom")
    --     end,
    --     desc = "Trouble: LSP Implementations",
    --     mode = "n",
    -- },
    -- {
    --     "<leader>lrr",
    --     function()
    --         vim.cmd("Trouble lsp_references toggle focus=false win.position=bottom")
    --     end,
    --     desc = "Trouble: LSP References",
    --     mode = "n",
    -- },
    -- {
    --     "<leader>lic",
    --     function()
    --         vim.cmd("Trouble lsp_incoming_calls toggle focus=false win.position=bottom")
    --     end,
    --     desc = "Trouble: LSP Incoming Calls",
    --     mode = "n",
    -- },
    {
        "<leader>oc",
        function()
            vim.cmd("Trouble lsp_outgoing_calls toggle focus=true")
        end,
        desc = "Trouble: LSP Outgoing Calls",
        mode = "n",
    },
    -- {
    --     "<leader>lgt",
    --     function()
    --         vim.cmd("Trouble lsp_type_definitions focus=false win.position=bottom")
    --     end,
    --     desc = "Trouble: LSP Type Definitions",
    --     mode = "n",
    -- },
}

local modes = {
    -- The LSP base mode for:
    -- * lsp_definitions, lsp_references, lsp_implementations
    -- * lsp_type_definitions, lsp_declarations, lsp_command
    lsp_base = {
        params = {
            include_current = true,
        },

    },
    lsp_preview = {
        mode = "lsp_base",
        params = {
            include_current = true,
        },
        restore = false,
        preview = {
            type = "float",
            realtive = "editor",
            size = { width = 0.5, height = 0.5 },
            position = { 0.5, 1 },
            border = "rounded",
            title = "Preview",
            title_pos = "center",
            wo = {
                number = true,
                statuscolumn = "%l",
            },
        },
        keys = {
            h = function(self, ctx)
                if ctx.item then
                    self:jump(ctx.item, { split = true })
                    self:close()
                end
            end,
            v = function(self, ctx)
                if ctx.item then
                    self:jump(ctx.item, { vsplit = true })
                    self:close()
                end
            end,
            t = function(self, ctx)
                if ctx.item then
                    self:close()
                    vim.api.nvim_command("tab sbuffer " .. self:main().buf)
                    self:jump(ctx.item)
                end
            end,
        },
    },

    -- sources define their own modes, which you can use directly,
    -- or override like in the example below
    lsp_definitions = {
        mode = "lsp_preview",
        win = {
            title = "Definitions",
        },
    },
    lsp_references = {
        mode = "lsp_preview",
        win = {
            title = "References",
        },
    },
    lsp_implementations = {
        mode = "lsp_preview",
        win = {
            title = "Implementations",
        },
    },
    lsp_type_definitions = {
        mode = "lsp_preview",
        win = {
            title = "Type Definitions",
        },
    },
    lsp = {
        mode = "lsp_preview",
    },
    lsp_outgoing_calls = {
        mode = "lsp_preview",
        win = {
            title = "Outgoing calls",
        },
    }
}


return {
    "folke/trouble.nvim",
    cmd = {
        "Trouble",
    },

    dependencies = {
        -- "nvim-tree/nvim-web-devicons",
    },

    keys = keys,

    opts = {
        modes = modes,
    },

    config = function(_, opts)
        require('trouble').setup(opts)
    end
}
