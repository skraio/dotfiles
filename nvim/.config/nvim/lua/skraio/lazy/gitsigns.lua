return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require('gitsigns').setup({
            signs                        = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            signs_staged                 = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            signs_staged_enable          = true,
            signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
            numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir                 = {
                follow_files = true
            },
            auto_attach                  = true,
            attach_to_untracked          = false,
            current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts      = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
                virt_text_priority = 100,
                use_focus = true,
            },
            current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
            sign_priority                = 6,
            update_debounce              = 100,
            status_formatter             = nil,   -- Use default
            max_file_length              = 40000, -- Disable if file is longer than this (in lines)
            preview_config               = {
                -- Options passed to nvim_open_win
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1
            },

            on_attach                    = function(bufnr)
                local gitsigns = require('gitsigns')

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map('n', ']c', function()
                    if vim.wo.diff then
                        vim.cmd.normal({ ']c', bang = true })
                    else
                        gitsigns.nav_hunk('next')
                    end
                end)

                map('n', '[c', function()
                    if vim.wo.diff then
                        vim.cmd.normal({ '[c', bang = true })
                    else
                        gitsigns.nav_hunk('prev')
                    end
                end)

                map('n', '<leader>ghp', function()
                    gitsigns.preview_hunk()
                end, { desc = "Gitsigns: Preview current hunk" })

                map('n', '<leader>ghs', function()
                    gitsigns.stage_hunk()
                end, { desc = "Gitsigns: Stage current hunk" })

                map('v', '<space>ghs', function()
                    gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') }
                end, { desc = "Gitsigns: Stage selected lines (visual mode)" })

                map('n', '<leader>ghr', function()
                    gitsigns.reset_hunk()
                end, { desc = "Gitsigns: Reset current hunk" })

                map('v', '<leader>ghr', function()
                    gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') }
                end, { desc = "Gitsigns: Reset selected lines (visual mode)" })

                map('n', '<leader>ghq', function()
                    vim.api.nvim_feedkeys(":Gitsigns setqflist ", "n", false)
                end, { desc = "Gitsigns: Send hunks to quickfix list" })

                map('n', '<leader>ghb', function()
                    vim.api.nvim_feedkeys(":Gitsigns change_base ", "n", false)
                end, { desc = "Gitsigns: Change base commit for diff" })

                map('n', '<leader>ghB', function()
                    gitsigns.reset_base()
                end, { desc = "Gitsigns: Reset base commit" })

                map('n', '<leader>gbl', function()
                    gitsigns.blame_line()
                end, { desc = "Gitsigns: Show git blame for current line" })

                map('n', '<leader>gbL', function()
                    gitsigns.blame_line { full = true }
                end, { desc = "Gitsigns: Show full git blame info for current line" })

                map('n', '<leader>ghS', function()
                    gitsigns.stage_buffer()
                end, { desc = "Gitsigns: Stage entire buffer" })

                map('n', '<leader>ghU', function()
                    gitsigns.reset_buffer()
                end, { desc = "Gitsigns: Reset entire buffer" })
            end
        })
    end
}
