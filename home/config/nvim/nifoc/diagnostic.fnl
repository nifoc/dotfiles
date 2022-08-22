(let [mod {}
      sign vim.cmd.sign
      api vim.api
      keymap (require :nifoc.keymap)
      augroup (vim.api.nvim_create_augroup :NifocDiagnostic {:clear true})
      aucmd vim.api.nvim_create_autocmd]
  (fn maybe-refresh-codelens [client]
    (when (client.supports_method :textDocument/codeLens)
      (vim.lsp.codelens.refresh)))

  (fn mod.setup []
    (vim.diagnostic.config {:underline true
                            :virtual_text false
                            :signs true
                            :float {:border :rounded :source true}
                            :update_in_insert false
                            :severity_sort true})
    (sign "define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticSignError")
    (sign "define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticSignWarn")
    (sign "define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticSignInfo")
    (sign "define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticSignHint"))

  (fn mod.maybe-enable-diagnostics [bufnr]
    (when (= vim.b.nifoc_diagnostics_enabled nil)
      (api.nvim_buf_set_var bufnr :nifoc_diagnostics_enabled 1)
      (aucmd [:CursorHold :CursorHoldI]
             {:callback #(vim.diagnostic.open_float {:focusable false
                                                     :focus false})
              :buffer bufnr
              :group augroup
              :desc "Open Diagnostic Window"})))

  (fn mod.maybe-enable-lsp [client bufnr]
    (when (= vim.b.nifoc_lsp_enabled nil)
      (api.nvim_buf_set_var bufnr :nifoc_lsp_enabled 1)
      (keymap.lsp-attach client bufnr)
      (mod.maybe-enable-diagnostics bufnr)
      (aucmd [:CursorHold :CursorHoldI :InsertLeave]
             {:callback #(maybe-refresh-codelens client)
              :buffer bufnr
              :group augroup
              :desc "Refresh Codelens"})))

  mod)

