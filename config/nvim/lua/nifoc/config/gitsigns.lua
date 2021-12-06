local ns = require('nifoc.utils.statusline')

--local theme_config = require('tokyonight.config')
--local theme_colors = require('tokyonight.colors').setup(theme_config)

--vim.cmd('highlight GitSignsStatuslineAdd guifg=' .. theme_colors.git.add .. ' guibg=#3b4261')
--vim.cmd('highlight GitSignsStatuslineChange guifg=' .. theme_colors.git.change .. ' guibg=#3b4261')
--vim.cmd('highlight GitSignsStatuslineDelete guifg=' .. theme_colors.red .. ' guibg=#3b4261')

require('gitsigns').setup {
  signs = {
    add = {hl = 'GitSignsAdd', text = '│', numhl='GitSignsAddNr', linehl='GitSignsAddLn'},
    change = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  numhl = false,
  linehl = false,
  status_formatter = ns.gitsigns_formatter,
  diff_opts = {
    internal = true,
  },
}
