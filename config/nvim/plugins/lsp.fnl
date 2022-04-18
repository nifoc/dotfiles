(let [lsp (require :lspconfig)
      lsp-status (require :lsp-status)
      illuminate (require :illuminate)
      virtual-types (require :virtualtypes)
      cmp (require :cmp_nvim_lsp)
      diagnostic (require :nifoc.diagnostic)]
  (fn custom-attach [client bufnr]
    (when client.server_capabilities.documentSymbolProvider
      (lsp-status.on_attach client bufnr))
    (when client.server_capabilities.documentHighlightProvider
      (illuminate.on_attach client bufnr))
    (when client.server_capabilities.codeLensProvider
      (virtual-types.on_attach client bufnr))
    (diagnostic.maybe-enable-lsp client bufnr)
    (diagnostic.maybe-enable-fixer client bufnr))

  (fn custom-attach-no-format [client bufnr]
    (set client.server_capabilities.documentFormattingProvider false)
    (set client.server_capabilities.documentRangeFormattingProvider false)
    (custom-attach client bufnr))

  ;; Setup
  (lsp-status.config {:current_function true
                      :show_filename false
                      :diagnostics false})
  (lsp-status.register_progress)
  ;; Custom handler
  (tset vim.lsp.handlers "textDocument/hover" (vim.lsp.with vim.lsp.handlers.hover {:border "rounded"}))
  (tset vim.lsp.handlers "textDocument/signatureHelp" (vim.lsp.with vim.lsp.handlers.signature_help {:border "rounded"}))
  ;; Servers
  (let [default-capabilities (vim.lsp.protocol.make_client_capabilities)
        capabilities (vim.tbl_extend :keep
                                     (cmp.update_capabilities default-capabilities)
                                     lsp-status.capabilities)
        flags {:allow_incremental_sync true :debounce_text_changes 700}
        default-config {:on_attach custom-attach : capabilities : flags}
        default-config-no-format {:on_attach custom-attach-no-format : capabilities : flags}
        default-servers [:bashls
                         :cssls
                         :dockerls
                         :erlangls
                         :eslint
                         :html
                         :rnix
                         :sqls
                         :taplo
                         :yamlls]]
    ;; Default
    (each [_ name (pairs default-servers)]
      ((. lsp name :setup) default-config))
    ;; Custom
    (lsp.elixirls.setup (->> {:cmd [:elixir-ls]}
                             (vim.tbl_extend :force default-config-no-format)))
    (lsp.tsserver.setup (->> {:cmd [:typescript-language-server
                                    :--stdio
                                    :--tsserver-path
                                    :tsserver]
                              :on_attach custom-attach-no-format}
                             (vim.tbl_extend :force default-config)))
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
                                                  :workspace {:library {(vim.fn.expand "\$VIMRUNTIME/lua") true
                                                                        (vim.fn.expand "\$VIMRUNTIME/lua/vim/lsp") true}}
                                                  :telemetry {:enable false}}}}
                                (vim.tbl_extend :force default-config)))))
