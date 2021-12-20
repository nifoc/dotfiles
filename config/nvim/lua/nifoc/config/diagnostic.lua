vim.diagnostic.config({
  underline = true,
  virtual_text = {
    source = false,
  },
  signs = false,
  update_in_insert = false,
})

vim.cmd('sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=')
vim.cmd('sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=')
vim.cmd('sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=')
vim.cmd('sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=')
