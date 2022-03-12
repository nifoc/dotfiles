local M = {}

local keymap = require('nifoc.keymap')

function M.maybe_enable_lsp(client, bufnr)
  if vim.b.nifoc_lsp_enabled == nil then
    vim.api.nvim_buf_set_var(bufnr, 'nifoc_lsp_enabled', 1)

    keymap.lsp_attach(client, bufnr)
  end
end

function M.maybe_enable_fixer(client, bufnr)
  if client.resolved_capabilities.document_formatting and vim.b.nifoc_fixer_enabled == nil then
    vim.api.nvim_buf_set_var(bufnr, 'nifoc_fixer_enabled', 1)

    local augroup_nifoc_diagnostic = vim.api.nvim_create_augroup("NifocDiagnostic", { clear = true })

    vim.api.nvim_create_autocmd("BufWritePre", { callback = function()
      vim.lsp.buf.formatting_sync(nil, 1000)
    end, group = augroup_nifoc_diagnostic, buffer = bufnr })
  end
end

return M
