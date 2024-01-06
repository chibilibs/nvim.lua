-- Lazy.nvim bootstrap

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
    --{
    --    "rose-pine/neovim",
    --    name = "rose-pine",
    --    config = function()
    --        require("rose-pine").setup({
    --            disable_background = true,
    --            disable_float_background = true,
    --        })
    --        vim.cmd("colorscheme rose-pine")
    --    end,
    --},

    {
        "bluz71/vim-moonfly-colors",
        name = "moonfly",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.moonflyCursorColor = true
            vim.g.moonflyItalics = true
            vim.g.moonflyNormalFloat = true
            vim.g.moonflyTerminalColors = true
            vim.g.moonflyVirtualTextColor = true

            vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
                vim.lsp.handlers.hover, {
                    border = "single"
                }
            )
            vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
                vim.lsp.handlers.signatureHelp, {
                    border = "single"
                }
            )
            vim.diagnostic.config({ float = { border = "single" } })


            vim.cmd("colorscheme moonfly")
        end
    },

    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.3",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    { "nvim-treesitter/nvim-treesitter", name = "treesitter", cmd = "TSUpdate" },

    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    {
        "theprimeagen/harpoon",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
        },
    },

    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        },
    },

    {
        "mrcjkb/rustaceanvim",
        version = "^3",
        ft = { "rust" },
    },

    { "RobertBrunhage/dart-tools.nvim" },

    {
        "akinsho/flutter-tools.nvim",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "stevearc/dressing.nvim", -- optional for vim.ui.select
        },
        config = true,
    },

    {
        "aserowy/tmux.nvim",
        config = function()
            return require("tmux").setup({
                copy_sync = {
                    redirect_to_clipboard = true,
                },
            })
        end,
    },

    {
        "nvimdev/guard.nvim",
        dependencies = {
            "nvimdev/guard-collection",
        },
    },

    {
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true },
    },

    {
        "folke/noice.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
    },
})
