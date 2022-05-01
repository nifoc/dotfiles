;; Based on https://github.com/nvim-lua/lsp-status.nvim
(let [mod {}
      current-function-symbols {:Class ""
                                :Enum "ﴳ"
                                :Function ""
                                :Interface ""
                                :Method ""
                                :Module ""
                                :Namespace ""
                                :Package ""
                                :Struct "ﴳ"}
      lsp-proto vim.lsp.protocol
      set-bufvar vim.api.nvim_buf_set_var
      augroup (vim.api.nvim_create_augroup :NifocLsp {:clear true})
      aucmd vim.api.nvim_create_autocmd]
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
              (extract-symbols item.children acc)))
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

  (fn handle-update-current-context [err result ctx config]
    (set-bufvar ctx.bufnr :nifoc_lsp_current_context "")
    (when (and (= err nil) (= (type result) :table))
      (let [filtered-symbols (->> result (extract-symbols [])
                                  (vim.tbl_filter current-function-symbol?))
            cursor-pos (vim.api.nvim_win_get_cursor 0)]
        (for [i (length filtered-symbols) 1 -1]
          (local sym (. filtered-symbols i))
          (when (cursor-in-range? cursor-pos sym.range)
            (let [current-context (.. (. current-function-symbols sym.kind) " "
                                      sym.text)]
              (set-bufvar ctx.bufnr :nifoc_lsp_current_context current-context)))))))

  (fn update-current-context [bufnr]
    (let [params {:textDocument (vim.lsp.util.make_text_document_params bufnr)}]
      (vim.lsp.buf_request bufnr :textDocument/documentSymbol params
                           handle-update-current-context)))

  (fn mod.on-attach [client bufnr]
    (when client.server_capabilities.documentSymbolProvider
      (aucmd [:CursorHold]
             {:callback #(update-current-context bufnr)
              :buffer bufnr
              :group augroup
              :desc "Update current function variable"})))

  mod)

