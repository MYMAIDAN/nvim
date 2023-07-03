local M = {}

function M.setup()
  local whichkey = require "which-key"

  local conf = {
    window = {
      border = "single", -- none, single, double, shadow
      position = "bottom", -- bottom, top
    },
  }

  local leader_opts = {
    mode = "n", -- Normal mode
    prefix = '<leader>',
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  }

  local mappings = {
    ["w"] = { "<cmd>update!<CR>", "Save" },
    ["q"] = { "<cmd>q!<CR>", "Quit" },

    b = {
      name = "Buffer",
      c = { "<Cmd>bd!<Cr>", "Close current buffer" },
      D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
    },

    z = {
      name = "Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
    },

  
    f = {
      name = "Find",
      f = { "<cmd>lua require('utils.finder').find_files()<cr>", "Files" },
      b = { "<cmd>FzfLua buffers<cr>", "Buffers" },
      o = { "<cmd>FzfLua oldfiles<cr>", "Old files" },
      g = { "<cmd>FzfLua live_grep<cr>", "Live grep" },
      c = { "<cmd>FzfLua commands<cr>", "Commands" },
      e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
      p = { "<cmd>Telescope project<CR>", "Project Manager" },
    },

    t = {
        name = "Terminal",
        d = { "<cmd>lua require('config.toggleterm').docker_client_toggle()<cr>", "LazyDocker" },
        g = { "<cmd>lua require('config.toggleterm').gitui_client_toggle()<cr>", "Gitui" },
    },
}

    local c_opts = {
        mode = "n",
        prefix = "",
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = false,
        expt  = true,
    }

    local c_mappings = {
        ["<C-b>"] = { "<cmd>NvimTreeToggle<CR>","Explorer" },
        ["<C-s>"] = { "<cmd>:w<CR>","Save" },
        ["<C-y>"] = { "<cmd>Telescope live_grep<CR>", "Search" },
        ["<C-p>"] = { "<cmd>Telescope git_files<CR>", "Find File" }
        
    }


  whichkey.setup(conf)
  whichkey.register(mappings, leader_opts)
  whichkey.register(c_mappings,c_opts)

end

return M
