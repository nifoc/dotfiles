(let [mod {}
      cache {:diagnostics {} :gitsigns {}}
      api vim.api
      o vim.opt
      b vim.b
      v vim.v
      get-bufvar api.nvim_buf_get_var
      statusline (require :nifoc.statusline)
      diagnostic vim.diagnostic
      (ok-gitsigns gitsigns) (pcall require :gitsigns)
      gitsigns-ns (api.nvim_create_namespace :gitsigns_signs_)
      augroup (vim.api.nvim_create_augroup :NifocStatuscolumn {:clear true})
      aucmd vim.api.nvim_create_autocmd]
  ;; Cache

  (fn cached-sign [key bufnr lnum]
    (?. cache key bufnr lnum))

  (fn maybe-setup-buffer-cache! [key bufnr]
    (when (= (. cache key bufnr) nil)
      (tset cache key bufnr {})))

  (fn clear-cache! [key bufnr]
    (tset cache key bufnr {}))

  (fn cache-filter [func t]
    (let [ret-tab {}]
      (each [k v (pairs t)] (when (func v k) (tset ret-tab k v)))
      ret-tab))

  (fn clear-diagnostics-cache! [bufnr diagnostics]
    (if (vim.tbl_isempty diagnostics) (tset cache :diagnostics bufnr nil)
        (let [namespaces (vim.tbl_map #$1.namespace diagnostics)
              current-cache (. cache :diagnostics bufnr)
              new-cache (cache-filter #(not (vim.tbl_contains namespaces $1.ns))
                                      current-cache)]
          (tset cache :diagnostics bufnr new-cache))))

  (fn update-cache-diagnostics [bufnr diagnostics]
    (maybe-setup-buffer-cache! :diagnostics bufnr)
    (clear-diagnostics-cache! bufnr diagnostics)
    (each [_ diagnostic (pairs diagnostics)]
      (let [lnum (+ diagnostic.lnum 1)
            current (cached-sign :diagnostics bufnr lnum)]
        (when (or (= current nil) (< diagnostic.severity current.severity))
          (tset cache :diagnostics bufnr lnum
                {:severity diagnostic.severity
                 :col diagnostic.col
                 :ns diagnostic.namespace})))))

  (fn update-cache-gitsigns [bufnr]
    (maybe-setup-buffer-cache! :gitsigns bufnr)
    (clear-cache! :gitsigns bufnr)
    (let [signs (api.nvim_buf_get_extmarks bufnr gitsigns-ns 0 -1
                                           {:details true})]
      (when (not (vim.tbl_isempty signs))
        (each [_ [_id row _col details] (pairs signs)]
          (let [lnum (+ row 1)
                current (cached-sign :gitsigns bufnr lnum)]
            (when (= current nil)
              (tset cache :gitsigns bufnr lnum {:name details.sign_hl_group})))))))

  (aucmd [:BufEnter :InsertLeave :DiagnosticChanged]
         {:callback #(update-cache-diagnostics $1.buf
                                               (vim.diagnostic.get $1.buf))
          :group augroup
          :desc "Update cached diagnostic signs"})
  (aucmd :User {:pattern :GitSignsUpdate
                :callback #(when (and (not= $1.data nil)
                                      (= (get-bufvar $1.data.buffer
                                                     :nifoc_gitsigns_enabled)
                                         1))
                             (update-cache-gitsigns $1.data.buffer))
                :group augroup
                :desc "Update cached gitsigns signs"})
  (aucmd :BufWipeout
         {:callback (fn [args]
                      (tset cache :diagnostics args.buf nil)
                      (tset cache :gitsigns args.buf nil))
          :group augroup
          :desc "Clear sign cache for current buffer"})
  (aucmd :BufWritePre
         {:callback #(tset cache :diagnostics $1.buf nil)
          :group augroup
          :desc "Reset diagnostic signs on save"})
  ;; Line Number
  (set mod.line-number {:condition #(or (o.number:get) (o.relativenumber:get))
                        1 statusline.push-right
                        2 {:provider (fn []
                                       (let [relnum-opt (o.relativenumber:get)
                                             relnum v.relnum
                                             virtnum v.virtnum]
                                         (if (not= virtnum 0) ""
                                             (and relnum-opt (= relnum 0)) "%l"
                                             relnum-opt (tostring relnum)
                                             "%l")))}})
  ;; Signs
  (set mod.signs {:provider "%s" :hl {:bold true}})
  ;; gitsigns
  (set mod.gitsigns {:condition #(= b.nifoc_gitsigns_enabled 1)
                     :init (fn [self]
                             (let [bufnr (api.nvim_get_current_buf)
                                   sign (cached-sign :gitsigns bufnr v.lnum)]
                               (set self.sign sign)
                               (set self.has_sign (not= sign nil))))
                     :provider " ▏"
                     :hl #(if $1.has_sign $1.sign.name :StatusLineNC)
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
                          buf-diagnostics (. cache :diagnostics bufnr)]
                      (and (= b.nifoc_diagnostics_enabled 1)
                           (not= buf-diagnostics nil)
                           (not (vim.tbl_isempty buf-diagnostics))))
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
                      sign (cached-sign :diagnostics bufnr v.lnum)]
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
