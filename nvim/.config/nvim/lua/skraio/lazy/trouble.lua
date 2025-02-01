local keys = {
    { "<leader>xb", function() require("trouble").toggle({ mode = "diagnostics", filter = { buf = 0 } }) end, desc = "Buffer Diagnostics (Trouble)", mode = "n" },
    { "<leader>xp", function() require("trouble").toggle({ mode = "diagnostics" }) end,                       desc = "Diagnostics (Trouble)",        mode = "n" },
    {
        "<leader>xq",
        function()
            require("trouble").close()
        end,
        desc = "Close (Trouble)",
        mode = "n"
    },
    {
        "]t",
        function()
            if not require("trouble").is_open() then
                require("trouble").open({ mode = "diagnostics" })
            else
                require("trouble").next({ skip_groups = true, jump = true })
            end
        end,
        desc = "Next diagnostic",
        mode = "n",
    },
    {
        "[t",
        function()
            if not require("trouble").is_open() then
                require("trouble").open({ mode = "diagnostics" })
            else
                require("trouble").prev({ skip_groups = true, jump = true })
            end
        end,
        desc = "Previous diagnostic",
        mode = "n",
    },
    {
        "<leader>xs",
        "<cmd>Trouble symbols toggle focus=false win.position=right win.size.width=42<cr>",
        desc = "Symbols (Trouble)",
    },
    {
        "<leader>K",
        "<cmd>Trouble lsp toggle focus=false win.position=right win.size.width=48<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
        "<leader>gd",
        "<cmd>Trouble lsp_definitions toggle focus=false win.position=bottom<cr>",
        desc = "LSP Definitions (Trouble)",
    },
    {
        "<leader>gi",
        "<cmd>Trouble lsp_implementations toggle focus=false win.position=bottom<cr>",
        desc = "LSP Implementations (Trouble)",
    },
    {
        "<leader>ref",
        "<cmd>Trouble lsp_references toggle focus=false win.position=bottom<cr>",
        desc = "LSP References (Trouble)",
    },
    {
        "<leader>Ic",
        "<cmd>Trouble lsp_incoming_calls toggle focus=false win.position=bottom<cr>",
        desc = "LSP Incoming calls (Trouble)",
    },
    {
        "<leader>Oc",
        "<cmd>Trouble lsp_outgoing_calls toggle focus=true win.position=right win.size.width=48<cr>",
        desc = "LSP Outgoing calls (Trouble)",
    },
    {
        "<leader>gt",
        "<cmd>Trouble lsp_type_definitions focus=false win.position=bottom<cr>",
        desc = "LSP Type Definitions (Trouble)",
    },
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
            position = { 0.5, 0 },
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
