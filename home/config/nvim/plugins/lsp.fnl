(let [lsp (require :lspconfig)
      cmp (require :cmp_nvim_lsp)
      navic (require :nvim-navic)
      diagnostic (require :nifoc.diagnostic)
      formatting (require :nifoc.formatting)
      augroup (vim.api.nvim_create_augroup :NifocLsp {:clear true})
      aucmd vim.api.nvim_create_autocmd]
  ;; Attach
  (aucmd :LspAttach {:callback (fn [args]
                                 (let [client (vim.lsp.get_client_by_id args.data.client_id)
                                       bufnr args.buf]
                                   (when (client.supports_method :textDocument/documentSymbol)
                                     (navic.attach client bufnr))
                                   (diagnostic.maybe-enable-lsp client bufnr)
                                   (formatting.maybe-enable-lsp client bufnr)))
                     :group augroup
                     :desc "Automatic LSP setup"})
  ;; Servers
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
                         :rnix
                         :sqls
                         :svelte
                         :taplo
                         :yamlls]]
    ;; Default
    (each [_ name (pairs default-servers)]
      ((. lsp name :setup) default-config))
    ;; Custom
    (lsp.elixirls.setup (->> {:cmd [:elixir-ls]}
                             (vim.tbl_extend :force default-config)))
    (lsp.tsserver.setup (->> {:cmd [:typescript-language-server
                                    :--stdio
                                    :--tsserver-path
                                    :tsserver]}
                             (vim.tbl_extend :force default-config)))
    (lsp.solargraph.setup (->> {:settings {:solargraph {:diagnostics true}}}
                               (vim.tbl_extend :force default-config)))
    (lsp.lua_ls.setup (->> {:cmd [:lua-language-server]
                            :root_dir (or (lsp.util.root_pattern :init.vim
                                                                 :init.lua :.git)
                                          (vim.loop.os_homedir))
                            :settings {:Lua {:runtime {:version :LuaJIT
                                                       :path (vim.split package.path
                                                                        ";")}
                                             :diagnostics {:globals [:vim]}
                                             :telemetry {:enable false}}}}
                           (vim.tbl_extend :force default-config)))))

