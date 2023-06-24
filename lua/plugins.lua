local M = {}

function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = false

  -- packer.nvim configuration
  local conf = {
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      }
      vim.cmd [[packadd packer.nvim]]
    end
    vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
  end

  -- Plugins
  local function plugins(use)
    use { "wbthomason/packer.nvim" }
       -- TJ created lodash of neovim
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
   
   -- use { "lewis6991/impatient.nvim" }

    -- LSP
    use {
        "neovim/nvim-lspconfig",
        opt = true,
        event = "BufReadPre",
        wants = { "nvim-lsp-installer" },
        config = function()
            require("config.lsp").setup()
        end,
        requires = {
            "williamboman/nvim-lsp-installer",
        },
    }

    -- Colorscheme
    use {
      "sainnhe/everforest",
      config = function()
        vim.cmd "colorscheme everforest"
      end,
    }

    -- Startup screen
    use {
      "goolord/alpha-nvim",
      config = function()
        require("config.alpha").setup()
      end,
    }

    -- Git
    use {
      "TimUntersberger/neogit",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("config.neogit").setup()
      end,
    }
    
    -- WhichKey
    use {
        "folke/which-key.nvim",
        config = function()
            require("config.whichkey").setup()
        end,
    }
    
    -- NvimTree
    use {
        "kyazdani42/nvim-tree.lua",
        requires = {
            "kyazdani42/nvim-web-devicons",
        },
        cmd = { "NvimTreeToggle", "NvimTreeClose" },
        config = function()
            require("config.nvimtree").setup()
        end,
    }
    
    -- StatusLine
    use {
        "nvim-lualine/lualine.nvim",
        event = "VimEnter",
        config = function()
            require("config.lualine").setup()
        end,
        requires = { "nvim-web-devicons" },
    }

    
    -- Code Prettier
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("config.treesitter").setup()
        end,
    }


    -- cmp
     use {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        opt = true,
        config = function()
            require("config.cmp").setup()
        end,
        wants = { "LuaSnip" },
        requires = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "ray-x/cmp-treesitter",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
        {
            "L3MON4D3/LuaSnip",
            wants = "friendly-snippets",
            config = function()
                require("config.luasnip").setup()
            end,
        },
        "rafamadriz/friendly-snippets",
        },
        disable = false,
    }   
    
    -- Auto pairs
    use {
      "windwp/nvim-autopairs",
      wants = "nvim-treesitter",
      module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
      config = function()
        require("config.autopairs").setup()
      end,
    }
    
    use("nvim-telescope/telescope-project.nvim")

    use {
        "nvim-telescope/telescope.nvim",
        config = function()
          require("config.telescope").setup()
        end,
    }
    
    use('ThePrimeagen/harpoon')

    use {
        "ahmedkhalf/project.nvim",
        config = function()
            require("config.project").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
        }
        end
    }

    -- Terminal
    use {
      "akinsho/toggleterm.nvim",
      config = function()
        require("config.toggleterm").setup()
      end,
    }

    if packer_bootstrap then
      print "Restart Neovim required after installation!"  require("packer").sync()
    end
  end

  packer_init()

  local packer = require "packer"
  packer.init(conf)
  packer.startup(plugins)
end

return M
