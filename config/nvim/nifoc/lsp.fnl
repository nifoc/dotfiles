(let [mod {}
      current-function-symbols {:Array "ﴳ "
                                :Class " "
                                :Enum "ﴳ "
                                :Function " "
                                :Interface " "
                                :Method " "
                                :Module " "
                                :Namespace " "
                                :Package " "
                                :Struct "ﴳ "}
      spinner-frames ["⣾" "⣽" "⣻" "⢿" "⡿" "⣟" "⣯" "⣷"]
      client-notifications {}
      lsp-proto vim.lsp.protocol
      set-bufvar vim.api.nvim_buf_set_var
      augroup (vim.api.nvim_create_augroup :NifocLsp {:clear true})
      aucmd vim.api.nvim_create_autocmd]
  (fn filter-sorted-table [test list]
    (let [results []]
      (each [_ item (ipairs list)]
        (when (test item)
          (table.insert results item)))
      results))

  ;; Current LSP Context
  ;; Based on https://github.com/nvim-lua/lsp-status.nvim

  (fn extract-symbols [acc items]
    (if (= items nil)
        acc
        (do
          (each [_ item (ipairs items)]
            (local kind (or (. lsp-proto.SymbolKind item.kind) :Unknown))
            (var sym-range nil)
            (if item.location (set sym-range item.location.range)
                item.range (set sym-range item.range))
            (when sym-range
              (do
                (set sym-range.start.line (+ sym-range.start.line 1))
                (set sym-range.end.line (+ sym-range.end.line 1))))
            (table.insert acc {:range sym-range : kind :text item.name})
            (when item.children
              (extract-symbols acc item.children)))
          acc)))

  (fn current-function-symbol? [item]
    (and item.range (not= (. current-function-symbols item.kind) nil)))

  (fn cursor-in-range? [cursor sym]
    (let [line (. cursor 1)
          char (. cursor 2)]
      (if (or (< line sym.start.line) (> line sym.end.line)) false
          (and (= line sym.start.line) (< char sym.start.character)) false
          (and (= line sym.end.line) (> char sym.end.character)) false
          true)))

  (fn handle-symbols-under-cursor [err result ctx config]
    (when (and (= err nil) (= (type result) :table))
      (let [symbols (extract-symbols [] result)
            cursor-pos (vim.api.nvim_win_get_cursor 0)]
        (print (.. "Symbols at under current position (" (. cursor-pos 1) ":"
                   (. cursor-pos 2) ")"))
        (each [_ sym (ipairs symbols)]
          (when (cursor-in-range? cursor-pos sym.range)
            (print (.. sym.kind ": " sym.text " (" sym.range.start.line ":"
                       sym.range.start.character " - " sym.range.end.line ":"
                       sym.range.end.character ")")))))))

  (fn handle-update-current-context [err result ctx config]
    (var context-levels [])
    (when (and (= err nil) (= (type result) :table))
      (let [filtered-symbols (->> result (extract-symbols [])
                                  (filter-sorted-table current-function-symbol?))
            cursor-pos (vim.api.nvim_win_get_cursor 0)]
        (each [_ sym (ipairs filtered-symbols)]
          (when (cursor-in-range? cursor-pos sym.range)
            (let [current-context (.. (. current-function-symbols sym.kind)
                                      sym.text)]
              (table.insert context-levels current-context))))))
    (set-bufvar ctx.bufnr :nifoc_lsp_current_context
                (table.concat context-levels "  "))
    (vim.api.nvim_command :redrawstatus))

  (fn update-current-context [bufnr]
    (let [params {:textDocument (vim.lsp.util.make_text_document_params bufnr)}]
      (vim.lsp.buf_request bufnr :textDocument/documentSymbol params
                           handle-update-current-context)))

  ;; Progress Notifications
  ;; Based on: https://github.com/rcarriga/nvim-notify/wiki/Usage-Recipes#progress-updates

  (fn get-notification-data [client-id token]
    (when (= (. client-notifications client-id) nil)
      (tset client-notifications client-id {}))
    (when (= (. client-notifications client-id token) nil)
      (tset client-notifications client-id token {}))
    (. client-notifications client-id token))

  (fn update-notifcation-spinner [client-id token]
    (let [notification-data (get-notification-data client-id token)]
      (when notification-data.spinner
        (let [new-spinner (% (+ notification-data.spinner 1)
                             (length spinner-frames))]
          (set notification-data.spinner new-spinner)
          (set notification-data.notification
               (vim.notify nil nil
                           {:hide_from_history true
                            :icon (. spinner-frames new-spinner)
                            :replace notification-data.notification}))
          (vim.defer_fn #(update-notifcation-spinner client-id token))))))

  (fn format-notifcation-title [title client-name]
    (.. client-name (if (> (length title) 0) (.. ": " title) "")))

  (fn format-notifcation-message [message percentage]
    (.. (if percentage (.. percentage "%\t") "") (if message message "")))

  (fn handle-progress [err result ctx]
    (let [client-id ctx.client_id
          val result.value
          kind val.kind
          lsp-client (vim.lsp.get_client_by_id client-id)
          client-name lsp-client.name
          notification-data (get-notification-data client-id result.token)]
      (if (= kind :begin)
          (let [message (format-notifcation-message val.message val.percentage)]
            (set notification-data.notification
                 (vim.notify message :info
                             {:title (format-notifcation-title val.title
                                                               client-name)
                              :icon (. spinner-frames 1)
                              :timeout false
                              :hide_from_history false}))
            (set notification-data.spinner 1)
            (update-notifcation-spinner client-id result.token))
          (and (= kind :report) notification-data)
          (let [message (format-notifcation-message val.message val.percentage)]
            (set notification-data.notification
                 (vim.notify message :info
                             {:replace notification-data.notification
                              :hide_from_history false})))
          (and (= kind :end) notification-data)
          (let [message (if val.message
                            (format-notifcation-message val.message)
                            :Complete)]
            (set notification-data.notification
                 (vim.notify message :info
                             {:icon ""
                              :replace notification-data.notification
                              :timeout 3000}))
            (set notification-data.spinner nil)))))

  ;; Public Interface

  (fn mod.register-progress-handler []
    (tset vim.lsp.handlers :$/progress handle-progress))

  (fn mod.symbols-under-cursor []
    (let [params {:textDocument (vim.lsp.util.make_text_document_params 0)}]
      (vim.lsp.buf_request 0 :textDocument/documentSymbol params
                           handle-symbols-under-cursor)))

  (fn mod.on-attach [client bufnr]
    (when client.server_capabilities.documentSymbolProvider
      (aucmd [:CursorHold]
             {:callback #(update-current-context bufnr)
              :buffer bufnr
              :group augroup
              :desc "Update current function variable"})))

  mod)

