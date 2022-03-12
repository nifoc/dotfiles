local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup {
  defaults = {
    prompt_prefix = ' ',
    selection_caret = ' ',
    set_env = { ['COLORTERM'] = 'truecolor' },

    layout_strategy = 'horizontal',
    layout_config = {
      horizontal = {
        preview_width = 0.50,
      },
    },

    path_display = {'smart', 'absolute'},

    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
  },

  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    }
  },
}

telescope.load_extension("zf-native")

-- Autocmds
local augroup_nifoc_telescope = vim.api.nvim_create_augroup("NifocTelescope", { clear = true })

vim.api.nvim_create_autocmd("FileType", { pattern = "TelescopePrompt", callback = function()
  vim.opt_local.cursorline = false
end, group = augroup_nifoc_telescope })

vim.api.nvim_create_autocmd("User" , { pattern = "TelescopePreviewerLoaded", command = "let w:is_telescope=v:true", group = augroup_nifoc_telescope })

vim.api.nvim_create_autocmd("BufWinEnter" , { callback = function()
  if vim.w.is_telescope then
    vim.opt_local.number = true
    vim.opt_local.relativenumber = false
    vim.opt_local.wrap = true
  end
end, group = augroup_nifoc_telescope })
