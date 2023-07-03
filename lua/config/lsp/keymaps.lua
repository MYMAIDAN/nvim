local M = {}

local whichkey = require "which-key"

local keymap = vim.api.nvim_set_keymap
local buf_keymap = vim.api.nvim_buf_set_keymap

local function keymappings(client, bufnr)
  local opts = { noremap = true, silent = true }

  -- Key mappings
  buf_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  keymap("n", "[e", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", opts)
  keymap("n", "]e", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", opts)

  keymap("n","<leader>lr","<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  keymap("n","<leader>la","<cmd>lua vim.lsp.buf.code_action()<CR>",opts)
  keymap("n","<leader>ld","<cmd>lua vim.diagnostic.open_float()<CR>",opts)
  keymap("n","<leader>li","<cmd>LspInfo<CR>",opts)

  keymap("n","gd","<cmd>lua vim.lsp.buf.definition()<CR>",opts)
  keymap("n","gD","<cmd>lua vim.lsp.buf.declaration()<CR>",otps)
  keymap("n","gs","<cmd>lua vim.lsp.buf.signature_help()<CR>",opts)
  keymap("n","gI","<cmd>lua vim.lsp.buf.implementation()<CR>",opts)
  keymap("n","gt","<cmd>lua vim.lsp.buf.type_definition()<CR>",opts)
end

function M.setup(client, bufnr)
  keymappings(client, bufnr)
end

return M
