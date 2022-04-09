(let [mod {}
      cmd vim.cmd
      api vim.api
      keymap (require :nifoc.keymap)
      lsp-format (require :lsp-format)]
  (fn mod.setup []
    (vim.diagnostic.config {:underline true
                            :virtual_text {:source false}
                            :signs false
                            :update_in_insert false})
    (cmd "sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=")
    (cmd "sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=")
    (cmd "sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=")
    (cmd "sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl="))

  (fn mod.maybe-enable-lsp [client bufnr]
    (when (= vim.b.nifoc_lsp_enabled nil)
      (api.nvim_buf_set_var bufnr :nifoc_lsp_enabled 1)
      (keymap.lsp-attach client bufnr)))

  (fn mod.maybe-enable-fixer [client bufnr]
    (when client.resolved_capabilities.document_formatting
      (api.nvim_buf_set_var bufnr :nifoc_fixer_enabled 1)
      (lsp-format.on_attach client bufnr)))

  mod)
