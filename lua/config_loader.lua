
require("lsp.lsp")
require("plugin.cmp")
-- require("gorg.plugin.neogit")
require("plugin.treesitter")
require("plugin.harpoon")

require('lualine').setup({
    options = { theme = "gruvbox" }
})
require('gitsigns').setup()

local autocmd = vim.api.nvim_create_autocmd
-- local yank_group = augroup('HighlightYank', {})

local chadtree_settings = {
    --
    -- "env",
    -- "solarized_dark_256",
    -- "solarized_dark",
    -- "solarized_light",
    -- "solarized_universal",
    -- "nord",
    -- "trapdoor",
    -- "nerdtree_syntax_light",
    -- "nerdtree_syntax_dark"
    --

    -- ["theme.text_colour_set"] = "trapdoor"
    ["theme.text_colour_set"] = "env"
}

vim.api.nvim_set_var("chadtree_settings", chadtree_settings)


autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({ "BufEnter", "BufWinEnter", "TabEnter" }, {
    pattern = "*.rs",
    callback = function()
        require("lsp_extensions").inlay_hints {}
    end
})

autocmd({ "BufWritePre" }, {
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

-- Format On Save
--vim.api.nvim_create_autocmd("BufWritePre", {command = "lua vim.lsp.buf.format {async = true}", group = group})
