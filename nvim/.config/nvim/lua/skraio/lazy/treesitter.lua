return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",

        config = function()
            require 'nvim-treesitter.configs'.setup {
                -- -- A list of parser names, or "all" (the five listed parsers should always be installed)
                -- ensure_installed = { "bash", "python", "go", "c", "lua", "vim", "vimdoc", "query", "xml", "http", "json", "graphql" },

                -- -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                highlight = {
                    enable = true,

                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },

                textobjects = {
                    move = {
                        enable = true,
                        set_jumps = true, -- whether to set jumps in the jumplist
                        goto_next_start = {
                            ["]f"] = "@function.outer",
                            ["]o"] = "@loop.*",
                        },
                        goto_previous_start = {
                            ["[f"] = "@function.outer",
                            ["[o"] = "@loop.*",
                        },
                        goto_next_end = {
                            ["]O"] = "@loop.*",
                        },
                        goto_previous_end = {
                            ["[O"] = "@loop.*",
                        },
                    },
                },
            }
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require 'treesitter-context'.setup {
                enable = false,           -- Enable this plugin (Can be enabled/disabled later via commands)
                multiwindow = false,      -- Enable multiwindow support.
                max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
                min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                line_numbers = true,
                multiline_threshold = 20, -- Maximum number of lines to show for a single context
                trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                mode = 'topline',          -- Line used to calculate context. Choices: 'cursor', 'topline'
                -- Separator between context and content. Should be a single character string, like '-'.
                -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                separator = nil,
                zindex = 20,     -- The Z-index of the context window
                on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
            }

            vim.keymap.set("n", "<leader>toc", function()
                vim.cmd("TSContext toggle")
            end, { desc = "Treesitter: Toggle object context" })
        end
    }
}
