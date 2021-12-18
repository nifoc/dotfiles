local null_ls = require('null-ls')
local builtins = null_ls.builtins

null_ls.setup({
  sources = {
    builtins.diagnostics.credo,
    builtins.formatting.fish_indent,
    builtins.diagnostics.hadolint,
    builtins.diagnostics.shellcheck.with({extra_args = { '-f', 'gcc', '-x' }}),
    builtins.formatting.shfmt.with({extra_args = { '-i', '2' }}),
  },
})
