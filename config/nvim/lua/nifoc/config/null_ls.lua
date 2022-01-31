local null_ls = require('null-ls')
local builtins = null_ls.builtins
local diagnostic_utils = require('nifoc.utils.diagnostic')

null_ls.setup({
  debounce = 700,

  sources = {
    builtins.formatting.fish_indent,
    builtins.formatting.shfmt.with({extra_args = { '-i', '2' }}),

    builtins.diagnostics.credo,
    builtins.diagnostics.hadolint,
    builtins.diagnostics.shellcheck.with({extra_args = { '-f', 'gcc', '-x' }}),
    builtins.diagnostics.statix,

    builtins.code_actions.shellcheck,
    builtins.code_actions.statix,
  },

  on_attach = function(client, bufnr)
    diagnostic_utils.maybe_enable_lsp(client, bufnr)
    diagnostic_utils.maybe_enable_fixer(client, bufnr)
  end,
})
