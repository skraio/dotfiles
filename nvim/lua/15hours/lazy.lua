local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
    "nvim-telescope/telescope.nvim", tag = "0.1.4",
-- or                              , branch = "0.1.x",
      dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        "rebelot/kanagawa.nvim",
        config = function()
            require('kanagawa').setup({
                commentStyle = {italic = false},
                keywordStyle = {italic = false},
                background = {
                    dark = "dragon",
                }
            })
            vim.cmd("colorscheme kanagawa")
        end,
    },
    {
	    "nvim-treesitter/nvim-treesitter",
	    build = ":TSUpdate",
    },
    {
	    'ThePrimeagen/harpoon',
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    },
    {
        "lervag/vimtex",
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
        "tpope/vim-surround",
    },
    {
        "tpope/vim-dadbod",
    },
    {
        "tpope/vim-obsession"
    }
})
