return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",

        config = function()
            require 'nvim-treesitter.configs'.setup {
                -- -- A list of parser names, or "all" (the five listed parsers should always be installed)
                ensure_installed = { "bash", "python", "go", "c", "lua", "vim", "vimdoc", "query", "xml", "http", "json", "graphql" },

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
                        set_jumps = true,  -- whether to set jumps in the jumplist
                        goto_next_start = {
                            ["]f"] = "@function.outer",
                        },
                        goto_previous_start = {
                            ["[f"] = "@function.outer",
                        },
                    },
                },
            }
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
    }
}
