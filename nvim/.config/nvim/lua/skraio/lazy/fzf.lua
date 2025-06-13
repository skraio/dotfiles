return {
    "ibhagwan/fzf-lua",

    config = function()
        local actions = require("fzf-lua").actions
        local fzflua = require("fzf-lua")

        --- files and buffers
        vim.keymap.set({ 'n' }, '<leader>ob', function()
            fzflua.buffers({ winopts = { preview = { hidden = "hidden" } } })
        end, {})

        vim.keymap.set({ 'n' }, '<leader>ol', function()
            fzflua.blines()
        end, {})

        vim.keymap.set({ 'n' }, '<leader>oL', function()
            fzflua.lines()
        end, {})

        vim.keymap.set({ 'n' }, '<leader>fd', function()
            fzflua.files()
        end, {})

        vim.keymap.set({ 'n' }, '<leader>fo', function()
            fzflua.oldfiles({
                cwd_only = true,
                winopts = { preview = { hidden = "hidden" } }
            })
        end, {})

        vim.keymap.set({ 'n' }, '<leader>fO', function()
            fzflua.oldfiles({ winopts = { preview = { hidden = "hidden" } } })
        end, {})

        vim.keymap.set({ 'n' }, '<leader>fc', function()
            fzflua.files({
                cwd = vim.fn.expand('%:p:h'),
                winopts = { preview = { hidden = "hidden" } }
            })
        end, {})

        vim.keymap.set({ 'n' }, '<leader>ot', function()
            fzflua.tabs({})
        end, {})

        vim.keymap.set({ 'n' }, '<leader>ht', function()
            fzflua.files({
                cwd = "~/personal/ht"
            })
        end, {})

        --- git
        vim.keymap.set({ 'n' }, '<leader>fgf', function()
            fzflua.git_files()
        end, {})

        vim.keymap.set({ 'n' }, '<leader>fgc', function()
            fzflua.git_commits()
        end, {})

        vim.keymap.set({ 'n' }, '<leader>fgb', function()
            fzflua.git_branches()
        end, {})

        vim.keymap.set({ 'n' }, '<leader>fgt', function()
            fzflua.git_tags()
        end, {})

        vim.keymap.set({ 'n' }, '<leader>fgs', function()
            fzflua.git_stash()
        end, {})

        -- grep

        vim.keymap.set({ 'n' }, '<leader>sw', function()
            fzflua.grep_cword()
        end, {})

        vim.keymap.set({ 'n' }, '<leader>sW', function()
            fzflua.grep_cWORD()
        end, {})

        vim.keymap.set({ 'n' }, '<leader>gW', function()
            fzflua.grep_curbuf({ search = vim.fn.expand("<cWORD>") })
        end, {})

        vim.keymap.set({ 'n' }, '<leader>gw', function()
            fzflua.blines({ query = vim.fn.expand("<cWORD>") })
        end, {})

        vim.keymap.set({ 'n' }, '<leader>sl', function()
            fzflua.live_grep_native({})
        end, {})

        vim.keymap.set({ 'n' }, '<leader>sc', function()
            fzflua.lgrep_curbuf()
        end, {})

        vim.keymap.set({ 'v' }, '<leader>sv', function()
            fzflua.grep_visual({})
        end, {})

        vim.keymap.set({ 'n' }, '<leader>sq', function()
            fzflua.lgrep_quickfix({})
        end, {})

        vim.keymap.set({ 'n' }, '<leader>sh', function()
            fzflua.live_grep_native({
                cwd = "~/personal/ht"
            })
        end, {})

        --- misc
        vim.keymap.set({ 'n' }, '<leader>rs', function()
            fzflua.resume()
        end, {})

        vim.keymap.set({ 'n' }, '<leader>vh', function()
            fzflua.helptags({ winopts = { preview = { hidden = "hidden" } } })
        end, {})

        vim.keymap.set({ 'n' }, '<leader>lc', function()
            fzflua.commands({ winopts = { preview = { hidden = true, }, }, })
        end, {})

        vim.keymap.set({ 'n' }, '<leader>sm', function()
            fzflua.marks({ winopts = { preview = { hidden = false, layout = "horizontal", } }, })
        end, {})

        --- lsp
        vim.keymap.set({ 'n' }, '<leader>fr', function()
            fzflua.lsp_references({ jump_to_single_result = true, ignore_current_line = true })
        end, {})

        --- setup
        require("fzf-lua").setup {
            defaults = {
                formatter = 'path.filename_first',
                -- formatter = 'path.dirname_first',
                silent = true,
            },

            winopts = {
                height    = 1.0,
                width     = 1.0,
                col       = 0,
                row       = 1,
                backdrop  = 0,
                border    = "border-top",
                title_pos = "left",
                hl        = {
                    border = "TelescopeBorder",
                    header_bind = "NonText",
                    header_text = "NonText",
                    help_normal = "NonText",
                    normal = "TelescopeNormal",
                    preview_border = "TelescopePreviewBorder",
                    preview_normal = "TelescopePreviewNormal",
                    search = "CmpItemAbbrMatch",
                    title = "TelescopeTitle",
                },
                preview   = {
                    border     = "border-top",
                    title_pos  = "left",
                    hidden     = false,
                    vertical   = "up:55%",
                    horizontal = "right:55%",
                    layout     = "vertical",
                    scrollbar  = false,
                    winopts    = {
                        number = true,
                    },
                },
            },
            previewers = {
                builtin = {
                    syntax_limit_b = 1024 * 1024, -- 100KB
                },
            },
            keymap = {
                builtin = {
                    -- `:tmap` mappings
                    false,
                    ["<C-/>"]    = "toggle-help",
                    [""]        = "toggle-help",
                    ["<C-o>"]    = "toggle-preview",
                    ["<M-k>"]    = "toggle-preview-ccw",
                    ["<M-j>"]    = "toggle-preview-cw",

                    ["<M-left>"] = "preview-page-reset",
                    ["<S-left>"] = "preview-reset",

                    ["<S-down>"] = "preview-page-down",
                    ["<S-up>"]   = "preview-page-up",
                },
                fzf = {
                    -- fzf '--bind=' options
                    false,
                    ["esc"]    = "abort",
                    ["alt-a"]  = "toggle-all",
                    ["ctrl-k"] = "kill-line",
                    ["ctrl-u"] = "unix-line-discard",
                    ["alt-g"]  = "first",
                    ["alt-G"]  = "last",
                    ["ctrl-/"] = "ignore",
                    ["ctrl-j"] = "ignore",
                },
            },
            actions = {
                files = {
                    ["enter"]  = actions.file_edit_or_qf,
                    ["ctrl-s"] = actions.file_split,
                    ["ctrl-v"] = actions.file_vsplit,
                    ["ctrl-t"] = actions.file_tabedit,
                    ["alt-q"]  = actions.file_sel_to_qf,
                    ["alt-Q"]  = actions.file_sel_to_ll,
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
                no_header_i = false,
                winopts     = {
                    preview = {
                        delay  = 0,
                        layout = "horizontal",
                        hidden = true,
                    },
                },
                previewer   = { toggle_behavior = "default" }
            },
            grep = {
                actions     = {
                    ["alt-i"] = { actions.toggle_ignore },
                    ["alt-h"] = { actions.toggle_hidden },
                },
                no_header_i = false,
            },
            buffers = {
                actions     = {
                    ["ctrl-x"] = { fn = actions.buf_del, reload = true },
                },
                no_header_i = false,
                winopts     = {
                    preview = {
                        delay = 0,
                    },
                },
                previewer   = { toggle_behavior = "extend" }
            },
            oldfiles = {
                winopts = {
                    preview = {
                        delay = 0,
                    },
                },
                previewer = { toggle_behavior = "extend" }
            },
        }
    end
}
