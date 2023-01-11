(let [mod {}
      sign vim.cmd.sign
      api vim.api
      keymap (require :nifoc.keymap)
      augroup (vim.api.nvim_create_augroup :NifocDiagnostic {:clear true})
      aucmd vim.api.nvim_create_autocmd]
  (fn maybe-refresh-codelens [client]
    (when (client.supports_method :textDocument/codeLens)
      (vim.schedule vim.lsp.codelens.refresh)))

  (fn mod.setup []
    (vim.diagnostic.config {:underline true
                            :virtual_text false
                            :signs true
                            :float {:border :rounded :source true}
                            :update_in_insert false
                            :severity_sort true})
    (sign "define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=")
    (sign "define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=")
    (sign "define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=")
    (sign "define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl="))

  (fn mod.maybe-enable-diagnostics [bufnr]
    (when (= vim.b.nifoc_diagnostics_enabled nil)
      (api.nvim_buf_set_var bufnr :nifoc_diagnostics_enabled 1)))

  (fn mod.maybe-enable-lsp [client bufnr]
    (when (= vim.b.nifoc_lsp_enabled nil)
      (api.nvim_buf_set_var bufnr :nifoc_lsp_enabled 1)
      (keymap.lsp-attach client bufnr)
      (mod.maybe-enable-diagnostics bufnr)
      (aucmd [:InsertLeave :BufEnter :BufWritePost]
             {:callback #(maybe-refresh-codelens client)
              :buffer bufnr
              :group augroup
              :desc "Refresh Codelens"})))

  mod)

