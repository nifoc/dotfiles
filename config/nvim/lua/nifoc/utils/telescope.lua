local telescope_themes = require('telescope.themes')

local M = {}

M.project_files = function()
  local git_opts = telescope_themes.get_ivy()
  local ok = pcall(require'telescope.builtin'.git_files, git_opts)

  if not ok then
    local find_opts = telescope_themes.get_ivy({
      find_command = { 'rg', '--files', '--hidden', '-L', '-g', '!.git/*' }
    })

    require('telescope.builtin').find_files(find_opts)
  end
end

return M
