local M = {}

local keymap = require('nifoc.keymap')

function M.maybe_enable_lsp(client, bufnr)
  local nifoc_lsp_enabled = vim.api.nvim_buf_get_var(bufnr, 'nifoc_lsp_enabled')

  if nifoc_lsp_enabled == nil then
    vim.api.nvim_buf_set_var(bufnr, 'nifoc_lsp_enabled', 1)

    keymap.lsp_attach(client, bufnr)
  end
end

function M.maybe_enable_fixer(client, bufnr)
  local nifoc_fixer_enabled = vim.api.nvim_buf_get_var(bufnr, 'nifoc_fixer_enabled')

  if client.resolved_capabilities.document_formatting and nifoc_fixer_enabled == nil then
    vim.api.nvim_buf_set_var(bufnr, 'nifoc_fixer_enabled', 1)

    vim.cmd [[
      augroup nifoc_diagnostic_formatting
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)
      augroup end
    ]]
  end
end

return M
