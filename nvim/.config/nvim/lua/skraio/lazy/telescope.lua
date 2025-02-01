return {
    "nvim-telescope/telescope.nvim",

    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        local actions = require("telescope.actions")

        local function filename_first(_, path)
            local tail = vim.fs.basename(path)
            local parent = vim.fs.dirname(path)
            if parent == "." then
                return tail
            end
            return string.format("%s\t\t%s", tail, parent)
        end

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "TelescopeResults",
            callback = function(ctx)
                vim.api.nvim_buf_call(ctx.buf, function()
                    vim.fn.matchadd("TelescopeParent", "\t\t.*$")
                    vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
                end)
            end,
        })

        require('telescope').setup({
            defaults = require('telescope.themes').get_ivy({
                sorting_strategy = 'ascending',

                layout_config = {
                    preview_width = 0.5,
                    prompt_position = 'top',
                },

                mappings = {
                    i = {
                        ['<C-h>'] = require('telescope.actions.layout').toggle_preview
                    }
                },

                preview = {
                    hide_on_startup = true
                },

            }),
            pickers = {
                find_files = {
                    path_display = filename_first,
                },
                git_files = {
                    path_display = filename_first,
                },
                buffers = {
                    -- sort_lastused = true,
                },
                lsp_references = {
                    previewer = true,
                    -- path_display = { "tail" },
                },
                oldfiles = {
                    path_display = filename_first,
                }

            },
        })
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader><leader>fp', builtin.resume, {})
        vim.keymap.set('n', '<leader><leader>fd', builtin.find_files, {})
        vim.keymap.set('n', '<leader><leader>fb', builtin.buffers, {})

        vim.keymap.set('n', '<leader><leader>en', function()
            builtin.find_files({ cwd = vim.fn.stdpath("config") })
        end, {})

        vim.keymap.set('n', '<leader><leader>fr', function()
            builtin.lsp_references({})
        end, {})

        vim.keymap.set('n', '<leader><leader>fo', function()
            builtin.oldfiles({cwd_only = true})
        end, {})

        vim.keymap.set('n', '<leader><leader>fa', builtin.oldfiles)

        vim.keymap.set('n', '<leader><leader>fc', function()
            builtin.find_files({
                search_dirs = {
                    vim.fn.expand('%:h')
                }
            })
        end, {})

        vim.keymap.set('n', '<leader><leader>fh', function()
            builtin.find_files({ find_command = { 'rg', '--ignore', '--hidden', '--files', '-u', '-g', '!.git' } })
        end, {})

        vim.keymap.set('n', '<leader><leader>fg', builtin.git_files, {})

        vim.keymap.set('n', '<leader><leader>sw', builtin.grep_string, {})
        vim.keymap.set('n', '<leader><leader>sW', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader><leader>sl', builtin.live_grep, {})

        vim.keymap.set('n', '<leader><leader>vh', builtin.help_tags, { desc = "Telescope: Show help tags" })
    end

}
