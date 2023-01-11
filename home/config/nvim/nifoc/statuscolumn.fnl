(let [mod {}
      api vim.api
      o vim.opt
      statusline (require :nifoc.statusline)]
  ;; Line Number
  (set mod.line-number
       {:condition #(or (o.number:get) (o.relativenumber:get))
        1 statusline.push-right
        2 {:provider (fn []
                       (let [num (o.number:get)
                             relnum (o.relativenumber:get)]
                         (if (and num (not relnum)) "%l"
                             (and relnum (not num)) "%r"
                             "%{v:relnum?v:relnum:v:lnum}")))}})
  ;; Signs
  (set mod.signs {:provider "%s" :hl {:bold true}})
  ;; gitsigns
  (set mod.gitsigns {:condition #(= vim.b.nifoc_gitsigns_enabled 1)
                     :init (fn [self]
                             (let [bufnr (api.nvim_get_current_buf)
                                   lnum vim.v.lnum
                                   sign (?. (vim.fn.sign_getplaced bufnr
                                                                   {:group :gitsigns_vimfn_signs_
                                                                    :id lnum
                                                                    : lnum})
                                            1 :signs 1)]
                               (set self.sign sign)
                               (set self.has_sign (not= sign nil))))
                     :provider #(if $1.has_sign " ▎" "  ")
                     :hl #(when $1.has_sign
                            $1.sign.name)})
  (set mod.gitsigns-or-space [{:condition #(or (o.number:get)
                                               (o.relativenumber:get))
                               :provider #(if (= vim.b.nifoc_gitsigns_enabled 1)
                                              "" "  ")}
                              mod.gitsigns])
  ;; Diagnostic signs
  (set mod.diagnostic-signs
       {:condition #(= vim.b.nifoc_diagnostics_enabled 1)
        :static {:sign-text {:DiagnosticSignError " "
                             :DiagnosticSignWarn " "
                             :DiagnosticSignInfo " "
                             :DiagnosticSignHint " "}}
        :init (fn [self]
                (let [bufnr (api.nvim_get_current_buf)
                      lnum vim.v.lnum
                      signs (?. (vim.fn.sign_getplaced bufnr
                                                       {:group "*" : lnum})
                                1 :signs)
                      diagnostic-signs (vim.tbl_filter #(vim.startswith $1.group
                                                                        :vim.diagnostic)
                                                       signs)
                      sign (?. diagnostic-signs 1)]
                  (set self.bufnr bufnr)
                  (set self.sign sign)
                  (set self.has_sign (not= sign nil))))
        :provider #(if $1.has_sign
                       (. $1.sign-text $1.sign.name)
                       "  ")
        :hl #(when $1.has_sign
               $1.sign.name)
        :on_click {:name :heirline_statuscolumn_diagnostic
                   :callback (fn [self]
                               (let [mouse (vim.fn.getmousepos)]
                                 (vim.schedule #(vim.diagnostic.open_float {:bufnr self.bufnr
                                                                            :pos (- mouse.line
                                                                                    1)
                                                                            :scope :line
                                                                            :focusable false}))))}})
  mod)

