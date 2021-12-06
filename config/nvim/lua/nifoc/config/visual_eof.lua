require('visual-eof').setup {
  text_EOL = '↵',
  text_NOEOL = '✗↵',
  ft_ng = {
    'fugitive.*',
    'git.*',
    'LspTrouble',
    'minimap',
    'netrw',
    'NvimTree',
    'packer',
    'TelescopePrompt',
  };
  buf_filter = function(bufnr)
    local disable_buftypes = {'terminal', 'nofile'}
    local buftype = vim.api.nvim_buf_get_option(bufnr, 'buftype')

    return not vim.tbl_contains(disable_buftypes, buftype)
  end;
}
