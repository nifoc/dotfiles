(let [navic (require :nvim-navic)
      diagnostic (require :nifoc.diagnostic)
      augroup (vim.api.nvim_create_augroup :NifocLsp {:clear true})
      aucmd vim.api.nvim_create_autocmd]
  (fn setup-inlay-hint-toggle [bufnr]
    (aucmd :InsertEnter {:callback #(vim.lsp.inlay_hint.enable false {: bufnr})
                         :buffer bufnr
                         :group augroup})
    (aucmd :InsertLeave {:callback #(vim.lsp.inlay_hint.enable true {: bufnr})
                         :buffer bufnr
                         :group augroup}))

  ;; Attach
  (aucmd :LspAttach {:callback (fn [args]
                                 (let [client (vim.lsp.get_client_by_id args.data.client_id)
                                       bufnr args.buf]
                                   (when (client.supports_method :textDocument/documentSymbol
                                                                 {: bufnr})
                                     (navic.attach client bufnr))
                                   (when (client.supports_method :textDocument/inlayHint
                                                                 {: bufnr})
                                     (vim.lsp.inlay_hint.enable true {: bufnr})
                                     (setup-inlay-hint-toggle bufnr))
                                   (diagnostic.maybe-enable-lsp client bufnr)))
                     :group augroup
                     :desc "Automatic LSP setup"})
  ;; Servers
  (vim.lsp.set_log_level :OFF)
  (vim.lsp.config "*" {:root_markers [:.git]})
  (vim.lsp.enable [:bashls
                   :cssls
                   :dockerls
                   :erlangls
                   :fennel_ls
                   :html
                   :jsonls
                   :lexical
                   :lua_ls
                   :marksman
                   :nil_ls
                   :taplo
                   :ts_ls
                   :yamlls]))
