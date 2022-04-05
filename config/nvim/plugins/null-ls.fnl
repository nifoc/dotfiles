(let [null-ls (require :null-ls)
      builtins null-ls.builtins
      diagnostic (require :nifoc.diagnostic)]
  (null-ls.setup {:debounce 700
                  :sources [; Formatting
                            builtins.formatting.fish_indent
                            builtins.formatting.fnlfmt
                            (builtins.formatting.shfmt.with {:extra_args [:-i
                                                                          :2]})
                            ; Diagnostics
                            builtins.diagnostics.credo
                            builtins.diagnostics.hadolint
                            (builtins.diagnostics.shellcheck.with {:extra_args [:-f
                                                                                :gcc
                                                                                :-x]})
                            builtins.diagnostics.statix
                            ; Code Actions
                            builtins.code_actions.shellcheck
                            builtins.code_actions.statix]
                  :on_attach (lambda [client bufnr]
                               (diagnostic.maybe-enable-lsp client bufnr)
                               (diagnostic.maybe-enable-fixer client bufnr))}))
