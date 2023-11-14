(let [lsp (require :lspconfig)
      lsp-configs (require :lspconfig.configs)
      cmp (require :cmp_nvim_lsp)
      navic (require :nvim-navic)
      diagnostic (require :nifoc.diagnostic)
      augroup (vim.api.nvim_create_augroup :NifocLsp {:clear true})
      aucmd vim.api.nvim_create_autocmd]
  (fn setup-inlay-hint-toggle [bufnr]
    (aucmd :InsertEnter {:callback #(vim.lsp.inlay_hint.enable bufnr false)
                         :buffer bufnr
                         :group augroup})
    (aucmd :InsertLeave {:callback #(vim.lsp.inlay_hint.enable bufnr true)
                         :buffer bufnr
                         :group augroup}))

  ;; Attach
  (aucmd :LspAttach {:callback (fn [args]
                                 (let [client (vim.lsp.get_client_by_id args.data.client_id)
                                       bufnr args.buf]
                                   (when (client.supports_method :textDocument/documentSymbol)
                                     (navic.attach client bufnr))
                                   (when (client.supports_method :textDocument/inlayHint)
                                     (vim.lsp.inlay_hint.enable bufnr true)
                                     (setup-inlay-hint-toggle bufnr))
                                   (diagnostic.maybe-enable-lsp client bufnr)))
                     :group augroup
                     :desc "Automatic LSP setup"})
  ;; Servers
  (vim.lsp.set_log_level :OFF)
  (let [capabilities (cmp.default_capabilities)
        flags {:allow_incremental_sync true :debounce_text_changes 700}
        default-config {: capabilities : flags}
        default-servers [:bashls
                         :cssls
                         :dockerls
                         :erlangls
                         :eslint
                         :fennel_ls
                         :html
                         :jsonls
                         :svelte
                         :taplo
                         :yamlls]]
    ;; Default
    (each [_ name (pairs default-servers)]
      ((. lsp name :setup) default-config))
    ;; Custom
    (when (not lsp-configs.lexical)
      (set lsp-configs.lexical
           {:default_config {:filetypes [:elixir :eelixir]
                             :cmd [:lexical :start]
                             :root_dir (fn [fname]
                                         (or ((lsp.util.root_pattern :mix.exs
                                                                     :.git) fname)
                                             (vim.loop.os_homedir)))
                             :settings {}}}))
    (if (= (vim.fn.executable :elixir-ls) 1)
        (lsp.elixirls.setup (->> {:cmd [:elixir-ls]}
                                 (vim.tbl_extend :force default-config)))
        (lsp.lexical.setup default-config))
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
      (lsp.tsserver.setup (->> {:cmd [:typescript-language-server
                                      :--stdio
                                      :--tsserver-path
                                      :tsserver]
                                :settings {:typescript {:inlayHints inlay-hints}
                                           :javascript {:inlayHints inlay-hints}}}
                               (vim.tbl_extend :force default-config))))
    (lsp.solargraph.setup (->> {:settings {:solargraph {:diagnostics true}}}
                               (vim.tbl_extend :force default-config)))
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
                             (vim.tbl_extend :force default-config))))))
