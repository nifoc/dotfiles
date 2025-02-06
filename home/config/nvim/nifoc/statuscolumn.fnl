(let [mod {}
      cache {:diagnostics {} :gitsigns {}}
      api vim.api
      o vim.opt
      b vim.b
      v vim.v
      diagnostic vim.diagnostic
      diagnostic-counts {}
      (ok-gitsigns gitsigns) (pcall require :gitsigns)
      gitsigns-ns (api.nvim_create_namespace :gitsigns_signs_)
      augroup (vim.api.nvim_create_augroup :NifocStatuscolumn {:clear true})
      aucmd vim.api.nvim_create_autocmd]
  ;; Cache
  (aucmd [:BufEnter :InsertLeave :DiagnosticChanged]
         {:callback #(tset diagnostic-counts $1.buf
                           (length (diagnostic.count $1.buf)))
          :group augroup
          :desc "Update diagnostic count"})
  (aucmd :BufWipeout
         {:callback #(tset diagnostic-counts $1.buf nil)
          :group augroup
          :desc "Clear diagnostic count for current buffer"})
  ;; Line Number
  (set mod.line-number {:provider "%l"})
  ;; Signs
  (set mod.signs {:provider "%s" :hl {:bold true}})
  ;; gitsigns
  (set mod.gitsigns {:condition #(= b.nifoc_gitsigns_enabled 1)
                     :init (fn [self]
                             (let [bufnr (api.nvim_get_current_buf)
                                   sign (. (api.nvim_buf_get_extmark_by_id bufnr
                                                                           gitsigns-ns
                                                                           v.lnum
                                                                           {:details true})
                                           3)]
                               (set self.sign sign)
                               (set self.has_sign (not= sign nil))))
                     :provider " ▏"
                     :hl #(if $1.has_sign $1.sign.sign_hl_group :StatusLineNC)
                     :on_click {:name :heirline_statuscolumn_gitsigns
                                :callback (fn [_self]
                                            (let [mouse (vim.fn.getmousepos)
                                                  cursor-pos [mouse.line 0]]
                                              (api.nvim_win_set_cursor mouse.winid
                                                                       cursor-pos)
                                              (vim.defer_fn #(when ok-gitsigns
                                                               (gitsigns.blame_line {:full true}))
                                                100)))}})
  (set mod.gitsigns-or-bar [{:condition #(and (not= b.nifoc_gitsigns_enabled 1)
                                              (or (o.number:get)
                                                  (o.relativenumber:get)))
                             :provider " ▏"
                             :hl :StatusLineNC}
                            mod.gitsigns])
  ;; Diagnostic signs
  (set mod.diagnostic-signs
       {:condition #(let [bufnr (api.nvim_get_current_buf)
                          count (. diagnostic-counts bufnr)]
                      (and (= b.nifoc_diagnostics_enabled 1) (not= count nil)
                           (> count 0)))
        :static {:sign-text {diagnostic.severity.ERROR " "
                             diagnostic.severity.WARN " "
                             diagnostic.severity.INFO " "
                             diagnostic.severity.HINT " "}
                 :sign-hl {diagnostic.severity.ERROR :DiagnosticSignError
                           diagnostic.severity.WARN :DiagnosticSignWarn
                           diagnostic.severity.INFO :DiagnosticSignInfo
                           diagnostic.severity.HINT :DiagnosticSignHint}}
        :init (fn [self]
                (let [bufnr (api.nvim_get_current_buf)
                      sign (. (diagnostic.get bufnr {:lnum (- v.lnum 1)}) 1)]
                  (set self.sign sign)
                  (set self.has_sign (not= sign nil))))
        :provider #(if $1.has_sign
                       (. $1.sign-text $1.sign.severity)
                       "  ")
        :hl #(when $1.has_sign
               (. $1.sign-hl $1.sign.severity))
        :on_click {:name :heirline_statuscolumn_diagnostic
                   :callback (fn [self]
                               (let [mouse (vim.fn.getmousepos)
                                     line (- mouse.line 1)
                                     cursor-pos [mouse.line 0]]
                                 (api.nvim_win_set_cursor mouse.winid
                                                          cursor-pos)
                                 (vim.defer_fn #(vim.diagnostic.open_float {:bufnr self.bufnr
                                                                            :pos line
                                                                            :scope :line})
                                   100)))}})
  ;; Debug
  (set mod._debug_cache #{: cache})
  mod)
