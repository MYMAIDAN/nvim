local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
end

return require("packer").startup(function()
    use("wbthomason/packer.nvim")

    -- Simple plugins can be specified as strings
    use("TimUntersberger/neogit")
    use("lewis6991/gitsigns.nvim")

    -- TJ created lodash of neovim
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-project.nvim")

    -- LSP stuff
    -- use("williamboman/mason.nvim")
    -- use("neovim/nvim-lspconfig")
    use("onsails/lspkind-nvim")
    use("nvim-lua/lsp_extensions.nvim")
    use("glepnir/lspsaga.nvim")
    use("simrat39/symbols-outline.nvim")

    -- use("simrat39/rust-tools.nvim")

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }

    -- Code Completion(IntelliSense)
    -- use("hrsh7th/nvim-cmp")
    -- use("hrsh7th/cmp-nvim-lsp")
    -- use("hrsh7th/cmp-buffer")
    -- use("hrsh7th/cmp-path")
    -- use("hrsh7th/cmp-vsnip")
    -- use("hrsh7th/vim-vsnip")

    use('ThePrimeagen/harpoon')

    -- use("L3MON4D3/LuaSnip")
    -- use("saadparwaiz1/cmp_luasnip")

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Color themes
    use("sainnhe/sonokai")

    use("folke/tokyonight.nvim")
    use("ellisonleao/gruvbox.nvim")

    use { "catppuccin/nvim", as = "catppuccin" }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use('nvim-treesitter/playground')
    use('romgrk/nvim-treesitter-context')

    -- Formating
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- FileTree
    use("ms-jpq/chadtree", {
        branch = "chad",
        run = "python3 -m chadtree deps"
    })

    use("simnalamburt/vim-mundo")

    -- Debug
    use("mfussenegger/nvim-dap")

    --Terminal
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
            require("toggleterm").setup()
        end}

    if packer_bootstrap then
        require('packer').sync()
    end
end)
