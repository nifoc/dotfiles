require('nvim-tree').setup {
  open_on_setup = false,
  auto_close = true,

  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true
  },

  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
}

vim.g.nvim_tree_quit_on_open = 0
vim.g.nvim_tree_respect_buf_cwd = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
}

vim.cmd('augroup nifoc_nvim_tree_telescope')
  vim.cmd('autocmd!')
  vim.cmd('autocmd User TelescopeFindPre NvimTreeClose')
vim.cmd('augroup end')
