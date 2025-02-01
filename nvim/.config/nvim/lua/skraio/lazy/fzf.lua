return {
    "ibhagwan/fzf-lua",

    config = function()
        local actions = require("fzf-lua").actions
        local config = require("fzf-lua").config
        local fzflua = require("fzf-lua")


        vim.keymap.set({ 'n' }, '<leader>fd', function()
            fzflua.files({})
        end, {})

        vim.keymap.set({ 'n' }, '<leader>fg', function()
            fzflua.git_files({})
        end, {})

        vim.keymap.set({ 'n' }, '<leader>fb', function()
            fzflua.buffers()
        end, {})

        vim.keymap.set({ 'n' }, '<leader>fa', function()
            fzflua.oldfiles()
        end, {})

        vim.keymap.set({ 'n' }, '<leader>fo', function()
            fzflua.oldfiles({ cwd_only = true })
        end, {})

        vim.keymap.set({ 'n' }, '<leader>fc', function()
            fzflua.find_files({
                search_dirs = {
                    vim.fn.expand('%:h')
                }
            })
        end, {})

        vim.keymap.set({ 'n' }, '<leader>fp', function()
            fzflua.resume()
        end, {})

        vim.keymap.set({ 'v' }, '<leader>sv', function()
            fzflua.grep_visual({})
        end, {})

        vim.keymap.set({ 'n' }, '<leader>sq', function()
            fzflua.lgrep_quickfix({})
        end, {})

        vim.keymap.set({ 'n' }, '<leader>sl', function()
            fzflua.live_grep_native({})
        end, {})

        vim.keymap.set({ 'n' }, '<leader>sw', function()
            fzflua.grep_cword()
        end, {})

        vim.keymap.set({ 'n' }, '<leader>sW', function()
            fzflua.grep_cWORD()
        end, {})

        vim.keymap.set({ 'n' }, '<leader>lc', function()
            fzflua.commands()
        end, {})

        vim.keymap.set({ 'n' }, '<leader>vh', function()
            fzflua.helptags()
        end, {})

        vim.keymap.set({ 'n' }, '<leader>sm', function()
            fzflua.marks()
        end, {})

        vim.keymap.set({ 'n' }, '<leader>fr', function()
            fzflua.lsp_references({ jump_to_single_result = true, ignore_current_line = true })
        end, {})

        vim.keymap.set({ 'n' }, '<leader>xs', function()
            fzflua.lsp_document_symbols()
        end, {})

        vim.keymap.set({ "n", "v", "i" }, "<C-x><C-f>", function()
            fzflua.complete_path({ formatter = 'path.dirname_first' })
        end, { silent = true, desc = "Fuzzy complete path" })

        -- winopts = { preview = { hidden = true } },

        require("fzf-lua").setup {
            defaults = {
                formatter = 'path.filename_first',
                -- formatter = 'path.dirname_first',
                silent = true,
            },
            winopts = {
                height = 0.8, -- window height
                width = 1.0,  -- window width
                row = 1,      -- window row position (0=top, 1=bottom)
                col = 0,      -- window col position (0=left, 1=right)
                backdrop = 40,
                border = false,
                hl = {
                    normal = "Normal",
                    border = "FloatBorder",
                    cursor = "Cursor",
                    cursorline = "CursorLine",
                    search = "Search",
                    scrollbar_f = "PmenuThumb",
                    scrollbar_e = "PmenuSbar",
                },
                preview = {
                    border = "single",
                    hidden = false,
                    vertical = "down:45%",
                    horizontal = "right:55%",
                    layout = "flex",
                    flip_columns = 100,
                    scrollbar = false,
                    title_pos = "center",
                    winopts = {
                        number = false,
                    },
                },
            },
            keymap = {
                builtin = {
                    -- `:tmap` mappings
                    ["<F1>"]     = "toggle-help",
                    ["<F2>"]     = "toggle-fullscreen",
                    ["<F3>"]     = "toggle-preview-wrap",
                    ["<C-o>"]    = "toggle-preview",
                    -- [""]        = "toggle-preview",
                    ["<F5>"]     = "toggle-preview-ccw",
                    ["<F6>"]     = "toggle-preview-cw",
                    -- ["<M-j>"]      = "preview-page-down",
                    -- ["<M-k>"]      = "preview-page-up",
                    ["<M-left>"] = "preview-page-reset",
                    ["<M-j>"]    = "preview-down",
                    ["<M-k>"]    = "preview-up",
                },
                fzf = {
                    -- fzf '--bind=' options
                    ["esc"]    = "abort",
                    ["alt-a"]  = "toggle-all",
                    ["alt-g"]  = "first",
                    ["alt-G"]  = "last",
                    ["ctrl-/"] = "ignore",
                },
            },
            files = {
                cwd_prompt  = false,
                git_icons   = false,
                actions     = {
                    ["alt-i"]  = { actions.toggle_ignore },
                    ["alt-h"]  = { actions.toggle_hidden },
                    ["ctrl-g"] = false,
                },
                no_header_i = true,
                winopts     = {
                    preview = {
                        hidden = "hidden",
                        delay = 0,
                    },
                },
            },
            grep = {
                actions     = {
                    ["alt-i"] = { actions.toggle_ignore },
                    ["alt-h"] = { actions.toggle_hidden },
                },
                no_header   = false,
                no_header_i = true,
            },
            buffers = {
                actions     = {
                    ["ctrl-x"] = { fn = actions.buf_del, reload = true },
                },
                no_header_i = true,
                winopts     = {
                    preview = {
                        hidden = "hidden",
                        delay = 0,
                    },
                },
            },
            oldfiles = {
                winopts = {
                    preview = {
                        hidden = "hidden",
                        delay = 0,
                    },
                },
            },
            previewers = {
                builtin = {
                    syntax_limit_b = 1024 * 100, -- 100KB
                },
            },
        }
    end
}
