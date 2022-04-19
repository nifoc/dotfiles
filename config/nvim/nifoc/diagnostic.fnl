(let [mod {}
      cmd vim.cmd
      api vim.api
      keymap (require :nifoc.keymap)]
  (fn mod.setup []
    (vim.diagnostic.config {:underline true
                            :virtual_text false
                            :signs true
                            :float {:border :rounded :source true}
                            :update_in_insert false
                            :severity_sort true})
    (cmd "sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticSignError")
    (cmd "sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticSignWarn")
    (cmd "sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticSignInfo")
    (cmd "sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticSignHint"))

  (fn mod.maybe-enable-lsp [client bufnr]
    (when (= vim.b.nifoc_lsp_enabled nil)
      (api.nvim_buf_set_var bufnr :nifoc_lsp_enabled 1)
      (keymap.lsp-attach client bufnr)
      (api.nvim_create_autocmd [:CursorHold :CursorHoldI]
                               {:callback #(vim.diagnostic.open_float nil
                                                                      {:focus false})
                                :buffer bufnr})))

  mod)
