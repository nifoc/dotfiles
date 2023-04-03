(let [mod {}
      cache {}
      api vim.api
      o vim.opt
      b vim.b
      v vim.v
      statusline (require :nifoc.statusline)
      diagnostic vim.diagnostic
      gitsigns (require :gitsigns)
      augroup (vim.api.nvim_create_augroup :NifocStatuscolumn {:clear true})
      aucmd vim.api.nvim_create_autocmd]
  ;; Cache

  (fn maybe-setup-buffer-cache! [bufnr key]
    (when (= (. cache bufnr) nil)
      (tset cache bufnr {}))
    (when (= (. cache bufnr key) nil)
      (tset cache bufnr key {})))

  (fn clear-cache! [bufnr key]
    (tset cache bufnr key {}))

  (fn cache-filter [func t]
    (let [ret-tab {}]
      (each [k v (pairs t)] (when (func v k) (tset ret-tab k v)))
      ret-tab))

  (fn clear-diagnostics-cache! [bufnr diagnostics]
    (let [key :diagnostics
          namespaces (vim.tbl_map #$1.namespace diagnostics)
          current-cache (. cache bufnr key)
          new-cache (cache-filter #(not (vim.tbl_contains namespaces $1.ns))
                                  current-cache)]
      (tset cache bufnr key new-cache)))

  (fn update-cache-diagnostics [bufnr diagnostics]
    (maybe-setup-buffer-cache! bufnr :diagnostics)
    (clear-diagnostics-cache! bufnr diagnostics)
    (each [_ diagnostic (pairs diagnostics)]
      (let [lnum (+ diagnostic.lnum 1)
            current (. cache bufnr :diagnostics lnum)]
        (when (or (= current nil) (> diagnostic.severity current.severity))
          (tset cache bufnr :diagnostics lnum
                {:severity diagnostic.severity
                 :col diagnostic.col
                 :ns diagnostic.namespace})))))

  (fn update-cache-gitsigns [bufnr]
    (maybe-setup-buffer-cache! bufnr :gitsigns)
    (clear-cache! bufnr :gitsigns)
    (let [signs (?. (vim.fn.sign_getplaced bufnr
                                           {:group :gitsigns_vimfn_signs_})
                    1 :signs)]
      (when (not= signs nil)
        (each [_ sign (pairs signs)]
          (let [lnum sign.lnum
                current (. cache bufnr :gitsigns lnum)]
            (when (= current nil)
              (tset cache bufnr :gitsigns lnum sign)))))))

  (fn cached-sign [bufnr key lnum]
    (?. cache bufnr key lnum))

  (aucmd :DiagnosticChanged
         {:callback #(update-cache-diagnostics $1.buf $1.data.diagnostics)
          :group augroup
          :desc "Update cached diagnostic signs"})
  (aucmd :User {:pattern :GitSignsUpdate
                :callback #(update-cache-gitsigns $1.buf)
                :group augroup
                :desc "Update cached gitsigns signs"})
  (aucmd :BufWipeout
         {:callback #(tset cache $1.buf nil)
          :group augroup
          :desc "Clear sign cache for current buffer"})
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
                                   sign (cached-sign bufnr :gitsigns v.lnum)]
                               (set self.sign sign)
                               (set self.has_sign (not= sign nil))))
                     :provider " ▏"
                     :hl #(if $1.has_sign $1.sign.name :StatusLineNC)
                     :on_click {:name :heirline_statuscolumn_gitsigns
                                :callback (fn [self]
                                            (let [mouse (vim.fn.getmousepos)
                                                  cursor-pos [mouse.line 0]]
                                              (api.nvim_win_set_cursor mouse.winid
                                                                       cursor-pos)
                                              (vim.defer_fn #(gitsigns.blame_line {:full true})
                                                100)))}})
  (set mod.gitsigns-or-bar [{:condition #(and (not= b.nifoc_gitsigns_enabled 1)
                                              (or (o.number:get)
                                                  (o.relativenumber:get)))
                             :provider " ▏"
                             :hl :StatusLineNC}
                            mod.gitsigns])
  ;; Diagnostic signs
  (set mod.diagnostic-signs
       {:condition #(and (= b.nifoc_diagnostics_enabled 1)
                         (> (length (vim.diagnostic.get 0)) 0))
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
                      sign (cached-sign bufnr :diagnostics v.lnum)]
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
  (set mod._debug_cache #cache)
  mod)

