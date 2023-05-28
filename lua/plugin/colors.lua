-- vim.g.gorg_colorscheme = "tokyonight"
-- vim.g.gorg_colorscheme = "sonokai"
vim.g.gorg_colorscheme = "gruvbox"

require("catppuccin").setup({
    flavour = "frappe", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false,
    show_end_of_buffer = false, -- show the '~' characters after the end of buffers
    term_colors = false,
    -- dim_inactive = {
    --     enabled = false,
    --     shade = "dark",
    --     percentage = 0.15,
    -- },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

-- setup must be called before loading
-- vim.cmd.colorscheme "catppuccin"
-- vim.g.gorg_colorscheme = "catppuccin"

function ColorMyPencils()
    -- vim.g.tokyonight_transparent_sidebar = true
    -- vim.g.tokyonight_transparent = true
    -- vim.g.tokyonight_style = "storm"
    -- vim.g.sonokai_transparent_background = 2
    vim.opt.background = "dark"
    -- vim.opt.background = "light"

    vim.cmd("colorscheme " .. vim.g.gorg_colorscheme)

    local hl = function(thing, opts)
       vim.api.nvim_set_hl(0, thing, opts)
    end

    hl("SignColumn", {
        bg = "none",
    })

    hl("ColorColumn", {
        ctermbg = 0,
        bg = "#555555",
    })

    hl("CursorLineNR", {
        bg = "None"
    })

    hl("Normal", {
        bg = "none"
    })

    hl("LineNr", {
        fg = "#5eacd3"
    })

    hl("netrwDir", {
        fg = "#5eacd3"
    })

end

ColorMyPencils()
