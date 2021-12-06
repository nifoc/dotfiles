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

telescope.load_extension('fzf')

vim.cmd('augroup nifoc_telescope')
  vim.cmd('autocmd!')
  vim.cmd('autocmd User TelescopePreviewerLoaded let w:is_telescope=v:true')
vim.cmd('augroup end')
