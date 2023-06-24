local M = {}

function M.setup()
  require'telescope'.load_extension('project')
  local project_actions = require("telescope._extensions.project.actions")
  extensions = {
      project = {
          hidden_files = true, -- default: false
          theme = "dropdown",
          order_by = "asc",
          search_by = "title",
          sync_with_nvim_tree = true,
          on_project_selected = function(prompt_bufnr)
              project_actions.change_working_directory(prompt_bufnr, false)
              require("harpoon.ui").nav_file(1)
          end
      }
  }
end

return M
