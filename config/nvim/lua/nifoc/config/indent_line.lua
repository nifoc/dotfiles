require('indent_blankline').setup {
  char = '¦',
  show_first_indent_level = false,
  use_treesitter = true,
  show_current_context = true,

  context_patterns = {
    'class',
    'function',
    'method',
    'do_block',
    'stab_clause',
  },

  buftype_exclude = {
    'help',
    'nofile',
    'terminal',
  },

  filetype_exclude = {
    'minimap',
    'packer',
  },
}
