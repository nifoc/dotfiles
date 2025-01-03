(let [lsp (require :lspconfig)
      cmp (require :blink.cmp)
      schemastore (require :schemastore)
      navic (require :nvim-navic)
      diagnostic (require :nifoc.diagnostic)
      augroup (vim.api.nvim_create_augroup :NifocLsp {:clear true})
      aucmd vim.api.nvim_create_autocmd
      ns (vim.api.nvim_create_namespace :nifoc_lsp_float)]
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
  (let [capabilities (cmp.get_lsp_capabilities nil true)
        handlers {:textDocument/hover (vim.lsp.with vim.lsp.handlers.hover
                                        {:border :rounded})
                  :textDocument/signatureHelp (vim.lsp.with vim.lsp.handlers.signature_help
                                                {:border :rounded})}
        flags {:allow_incremental_sync true :debounce_text_changes 700}
        default-config {: capabilities : handlers : flags}
        default-servers [:bashls
                         :cssls
                         :dockerls
                         :erlangls
                         :fennel_ls
                         :html
                         :jsonls
                         :marksman
                         :svelte
                         :taplo]]
    ;; Default
    (each [_ name (pairs default-servers)]
      ((. lsp name :setup) default-config))
    ;; Custom
    (when (= (vim.fn.executable :elixir-ls) 1)
      (lsp.elixirls.setup (->> {:cmd [:elixir-ls]}
                               (vim.tbl_extend :force default-config))))
    (lsp.jsonls.setup (->> {:settings {:json {:schemas (schemastore.json.schemas)
                                              :validate {:enable true}}}}
                           (vim.tbl_extend :force default-config)))
    (when (= (vim.fn.executable :lexical) 1)
      (lsp.lexical.setup (->> {:cmd [:lexical :start]}
                              (vim.tbl_extend :force default-config))))
    (when (= (vim.fn.executable :nextls) 1)
      (lsp.nextls.setup (->> {:cmd [:nextls]}
                             (vim.tbl_extend :force default-config))))
    (when (= (vim.fn.executable :lua-language-server) 1)
      (lsp.lua_ls.setup (->> {:cmd [:lua-language-server]
                              :root_dir (or (lsp.util.root_pattern :init.vim
                                                                   :init.lua
                                                                   :.git)
                                            (vim.loop.os_homedir))
                              :settings {:Lua {:runtime {:version :LuaJIT
                                                         :path (vim.split package.path
                                                                          ";")}
                                               :diagnostics {:globals [:vim]}
                                               :telemetry {:enable false}}}}
                             (vim.tbl_extend :force default-config))))
    (when (= (vim.fn.executable :nil) 1)
      (lsp.nil_ls.setup (->> {:settings {:nil {:formatting {:command [:nixpkgs-fmt]}}}}
                             (vim.tbl_extend :force default-config))))
    (when (= (vim.fn.executable :nixd) 1)
      (lsp.nixd.setup (->> {:settings {:formatting {:command [:nixpkgs-fmt]}}}
                           (vim.tbl_extend :force default-config))))
    (let [inlay-hints {:includeInlayParameterNameHints :all
                       :includeInlayParameterNameHintsWhenArgumentMatchesName false
                       :includeInlayFunctionParameterTypeHints true
                       :includeInlayVariableTypeHints true
                       :includeInlayVariableTypeHintsWhenTypeMatchesName false
                       :includeInlayPropertyDeclarationTypeHints true
                       :includeInlayFunctionLikeReturnTypeHints true
                       :includeInlayEnumMemberValueHints true}]
      (lsp.ts_ls.setup (->> {:cmd [:typescript-language-server :--stdio]
                             :settings {:typescript {:inlayHints inlay-hints}
                                        :javascript {:inlayHints inlay-hints}}}
                            (vim.tbl_extend :force default-config))))
    (lsp.solargraph.setup (->> {:settings {:solargraph {:diagnostics true}}}
                               (vim.tbl_extend :force default-config)))
    (lsp.yamlls.setup (->> {:settings {:yaml {:schemaStore {:enable false
                                                            :url ""}
                                              :schemas (schemastore.yaml.schemas)}}}
                           (vim.tbl_extend :force default-config)))))
