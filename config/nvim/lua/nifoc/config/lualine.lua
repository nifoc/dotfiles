local ns = require('nifoc.utils.statusline')

--local theme_config = require('tokyonight.config')
--local theme_colors = require('tokyonight.colors').setup(theme_config)

require('lualine').setup {
  options = {
    theme = 'dracula-nvim',
    -- section_separators = {'', ''},
    section_separators = '',
    -- component_separators = {'', ''},
    component_separators = '|',
    icons_enabled = true,
  },

  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      'b:gitsigns_status',
      {
        'diagnostics',
        sources = {'nvim_lsp'},
        --color_error = {fg =theme_colors.error},
        --color_warn = {fg = theme_colors.warning},
        --color_info = {fg = theme_colors.info},
        symbols = {error = ' ', warn = ' ', info = ' '}
      },
    },
    lualine_c = {ns.current_function},

    lualine_x = {'filetype', ns.lsp_enabled, ns.treesitter_enabled, ns.fixer_enabled, ns.spell_enabled},
    lualine_y = {ns.current_line_percent},
    lualine_z = {ns.line_column},
  },

  extensions = { 'nvim-tree' },
}
