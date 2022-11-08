(let [lsp (require :lspconfig)
      cmp (require :cmp_nvim_lsp)
      navic (require :nvim-navic)
      diagnostic (require :nifoc.diagnostic)
      formatting (require :nifoc.formatting)]
  (fn custom-attach [client bufnr]
    (when (client.supports_method :textDocument/documentSymbol)
      (navic.attach client bufnr))
    (diagnostic.maybe-enable-lsp client bufnr)
    (formatting.maybe-enable-lsp client bufnr))

  (fn custom-attach-no-format [client bufnr]
    (set client.server_capabilities.documentFormattingProvider false)
    (set client.server_capabilities.documentRangeFormattingProvider false)
    (custom-attach client bufnr))

  ;; Servers
  (let [capabilities (cmp.default_capabilities)
        flags {:allow_incremental_sync true :debounce_text_changes 700}
        default-config {:on_attach custom-attach : capabilities : flags}
        default-config-no-format {:on_attach custom-attach-no-format
                                  : capabilities
                                  : flags}
        default-servers [:bashls
                         :cssls
                         :dockerls
                         :erlangls
                         :eslint
                         :html
                         :nil_ls
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
                             (vim.tbl_extend :force default-config-no-format)))
    (lsp.jsonls.setup (->> {:cmd [:vscode-json-language-server :--stdio]}
                           (vim.tbl_extend :force default-config)))
    (lsp.solargraph.setup (->> {:settings {:solargraph {:diagnostics true}}}
                               (vim.tbl_extend :force default-config)))
    (lsp.sumneko_lua.setup (->> {:cmd [:lua-language-server]
                                 :root_dir (or (lsp.util.root_pattern :init.vim
                                                                      :init.lua
                                                                      :.git)
                                               (vim.loop.os_homedir))
                                 :settings {:Lua {:runtime {:version :LuaJIT
                                                            :path (vim.split package.path
                                                                             ";")}
                                                  :diagnostics {:globals [:vim]}
                                                  :telemetry {:enable false}}}}
                                (vim.tbl_extend :force default-config)))))

