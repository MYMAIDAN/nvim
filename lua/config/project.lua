local M = {}

function M.setup()
  require("project_nvim").setup {
    patterns = { ".git" },
  }
end

return M
