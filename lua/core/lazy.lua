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

local plugins = {
	{'nvim-telescope/telescope.nvim', branch = '0.1.x',
        dependencies = { {'nvim-lua/plenary.nvim'} }
	},
	{ 'rose-pine/neovim', name = 'rose-pine' },
    { "rebelot/kanagawa.nvim" },
	{'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
    { 'nvim-treesitter/nvim-treesitter-refactor' },
	{ 'mbbill/undotree' },
	{
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
	},
	{
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
	},
	{ "lukas-reineke/indent-blankline.nvim" },
    { "nvim-treesitter/nvim-treesitter-context" },
	{
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
    { 'tomasky/bookmarks.nvim' },
	{
        'goolord/alpha-nvim',
        dependencies = {
            { 'nvim-tree/nvim-web-devicons'}
        }
	},
	{ 'kalvinpearce/ShaderHighlight' },
	{ 'Shatur/neovim-session-manager',
        dependencies = {
            { 'nvim-lua/plenary.nvim'},
            { 'stevearc/dressing.nvim'}, --optional
            { 'nvim-telescope/telescope-ui-select.nvim'} --optional
        }
    },
    {'mfussenegger/nvim-dap'},
    {'rcarriga/nvim-dap-ui'},
    {'mfussenegger/nvim-dap-python'},
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional - Diff integration

            "nvim-telescope/telescope.nvim", -- optional
        },
        config = true
    },
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        'RRethy/vim-illuminate'
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },
    { "hrsh7th/cmp-cmdline" }
}
local opts = {}

require("lazy").setup(plugins, opts)
