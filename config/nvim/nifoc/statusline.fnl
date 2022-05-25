(let [mod {:heirline {}}
      api vim.api
      heirline-utils (require :heirline.utils)
      heirline-conditions (require :heirline.conditions)
      web-devicons (require :nvim-web-devicons)
      dracula (require :dracula)
      colors (dracula.colors)]
  (fn buffer-variable-exists? [key]
    (not= (. vim :b key) nil))

  (fn get-current-line []
    (let [cl (api.nvim_win_get_cursor 0)]
      (. cl 1)))

  (fn get-total-lines []
    (vim.api.nvim_buf_line_count 0))

  ;; Utils
  (set mod.heirline.default-hl
       (fn []
         {:bg colors.black}))
  (set mod.heirline.space {:provider " "})
  (set mod.heirline.spacer {:provider " " :hl {:fg colors.bg :bg colors.bg}})
  ;; Mode
  (set mod.heirline.vi-mode
       {:init (fn [self]
                (let [mode (. (api.nvim_get_mode) :mode)]
                  (set self.mode mode)))
        :static {:mode-names {:n :NORMAL
                              :no :O-PENDING
                              :nov :O-PENDING
                              :noV :O-PENDING
                              "no\022" :O-PENDING
                              :niI :NORMAL
                              :niR :NORMAL
                              :niV :NORMAL
                              :nt :NORMAL
                              :v :VISUAL
                              :vs :VISUAL
                              :V :V-LINE
                              :Vs :V-LINE
                              "\022" :V-BLOCK
                              "\022s" :V-BLOCK
                              :s :SELECT
                              :S :S-LINE
                              "\019" :S-BLOCK
                              :i :INSERT
                              :ic :INSERT
                              :ix :INSERT
                              :R :REPLACE
                              :Rc :REPLACE
                              :Rx :REPLACE
                              :Rv :V-REPLACE
                              :Rvc :V-REPLACE
                              :Rvx :V-REPLACE
                              :c :COMMAND
                              :cv :EX
                              :ce :EX
                              :r :REPLACE
                              :rm :MORE
                              :r? :CONFIRM
                              :! :SHELL
                              :t :TERMINAL}
                 :mode-hl {:n {:fg colors.black :bg colors.purple :bold true}
                           :i {:fg colors.black :bg colors.green :bold true}
                           :v {:fg colors.black :bg colors.pink :bold true}
                           :V {:fg colors.black :bg colors.pink :bold true}
                           "\022" {:fg colors.black :bg colors.pink :bold true}
                           :c {:fg colors.black :bg colors.yellow :bold true}
                           :s {:fg colors.black :bg colors.orange :bold true}
                           :S {:fg colors.black :bg colors.orange :bold true}
                           "\019" {:fg colors.black
                                   :bg colors.orange
                                   :bold true}
                           :R {:fg colors.black :bg colors.yellow :bold true}
                           :r {:fg colors.black :bg colors.yellow :bold true}
                           :! {:fg colors.black :bg colors.purple :bold true}
                           :t {:fg colors.black :bg colors.purple :bold true}}}
        :provider (fn [self]
                    (.. " " (. self :mode-names self.mode) " "))
        :hl (fn [self]
              (let [short-mode (self.mode:sub 1 1)]
                (. self :mode-hl short-mode)))})
  ;; Filetype
  (set mod.heirline.filetype-block
       {:init (fn [self]
                (set self.filename (api.nvim_buf_get_name 0)))})
  (set mod.heirline.file-icon
       {:init (fn [self]
                (let [filename self.filename
                      ext (vim.fn.fnamemodify filename ":e")
                      (icon color) (web-devicons.get_icon_color filename ext
                                                                {:default true})]
                  (set self.icon icon)
                  (set self.icon-color color)))
        :provider (fn [self]
                    (when self.icon
                      (.. self.icon " ")))
        :hl (fn [self]
              {:fg self.icon-color})})
  (set mod.heirline.filetype
       {:provider (fn []
                    (let [ft vim.bo.filetype]
                      (if (> (ft:len) 0) ft "no ft")))
        :hl {:fg colors.white}})
  (set mod.heirline.filetype-block
       (heirline-utils.insert mod.heirline.filetype-block
                              mod.heirline.file-icon mod.heirline.filetype))
  ;; git
  (set mod.heirline.git {:condition heirline-conditions.is_git_repo
                         :init (fn [self]
                                 (let [git-status vim.b.gitsigns_status_dict]
                                   (set self.git-head git-status.head)
                                   (set self.git-added (or git-status.added 0))
                                   (set self.git-removed
                                        (or git-status.removed 0))
                                   (set self.git-changed
                                        (or git-status.changed 0))
                                   (set self.has-changes?
                                        (or (> self.git-added 0)
                                            (> self.git-removed 0)
                                            (> self.git-changed 0)))))
                         1 {:provider (fn [self]
                                        (.. "  " self.git-head " "))
                            :hl {:fg colors.black :bg colors.orange :bold true}}
                         2 {:condition (fn [self]
                                         self.has-changes?)
                            :provider " "}
                         3 {:provider (fn [self]
                                        (let [spacer (if (or (> self.git-removed
                                                                0)
                                                             (> self.git-changed
                                                                0))
                                                         " " "")]
                                          (when (> self.git-added 0)
                                            (.. " " self.git-added spacer))))
                            :hl {:fg colors.bright_green}}
                         4 {:provider (fn [self]
                                        (let [spacer (if (> self.git-changed 0)
                                                         " " "")]
                                          (when (> self.git-removed 0)
                                            (.. " " self.git-removed spacer))))
                            :hl {:fg colors.bright_red}}
                         5 {:provider (fn [self]
                                        (when (> self.git-changed 0)
                                          (.. " " self.git-changed)))
                            :hl {:fg colors.cyan}}})
  ;; Diagnostics
  (set mod.heirline.diagnostics
       {:condition heirline-conditions.has_diagnostics
        :init (fn [self]
                (let [d vim.diagnostic]
                  (set self.errors
                       (length (d.get 0 {:severity d.severity.ERROR})))
                  (set self.warnings
                       (length (d.get 0 {:severity d.severity.WARN})))
                  (set self.info (length (d.get 0 {:severity d.severity.INFO})))
                  (set self.hints
                       (length (d.get 0 {:severity d.severity.HINT})))))
        1 {:provider (fn [self]
                       (let [spacer (if (or (> self.warnings 0) (> self.info 0)
                                            (> self.hints 0))
                                        " " "")]
                         (when (> self.errors 0)
                           (.. " " self.errors spacer))))
           :hl {:fg colors.red}}
        2 {:provider (fn [self]
                       (let [spacer (if (or (> self.info 0) (> self.hints 0))
                                        " " "")]
                         (when (> self.warnings 0)
                           (.. " " self.warnings spacer))))
           :hl {:fg colors.yellow}}
        3 {:provider (fn [self]
                       (let [spacer (if (> self.hints 0) " " "")]
                         (when (> self.info 0)
                           (.. " " self.info spacer))))
           :hl {:fg colors.cyan}}
        4 {:provider (fn [self]
                       (when (> self.hints 0)
                         (.. " " self.hints)))
           :hl {:fg colors.cyan}}})
  ;; Current Function
  (set mod.heirline.current-function
       {:condition heirline-conditions.lsp_attached
        :provider (fn []
                    (let [ctx vim.b.nifoc_lsp_current_context]
                      (when (and (not= ctx nil) (> (ctx:len) 0))
                        ctx)))
        :hl {:fg colors.white}})
  ;; Buffer Options
  (set mod.heirline.buffer-options
       {:init (fn [self]
                (set self.has-options?
                     (or (buffer-variable-exists? :nifoc_lsp_enabled)
                         (buffer-variable-exists? :nifoc_treesitter_enabled)
                         vim.wo.spell)))
        :hl {:fg colors.black :bg colors.orange}
        1 {:condition (fn [self]
                        self.has-options?)
           :provider " "}
        2 {:provider (fn []
                       (when (buffer-variable-exists? :nifoc_lsp_enabled)
                         " "))}
        3 {:provider (fn []
                       (when (or (buffer-variable-exists? :nifoc_lsp_formatter_enabled)
                                 (not= (vim.opt_local.formatprg:get) ""))
                         " "))}
        4 {:provider (fn []
                       (when (buffer-variable-exists? :nifoc_treesitter_enabled)
                         " "))}
        5 {:provider (fn []
                       (when vim.wo.spell
                         "暈 "))}})
  ;; Position
  (set mod.heirline.position {:init (fn [self]
                                      (let [pos (api.nvim_win_get_cursor 0)]
                                        (set self.position-line
                                             (tostring (. pos 1)))
                                        (set self.position-column
                                             (tostring (. pos 2)))))
                              :provider (fn [self]
                                          (string.format " %3s:%-3s "
                                                         self.position-line
                                                         self.position-column))
                              :hl {:fg colors.black
                                   :bg colors.purple
                                   :bold true}})
  ;; Scrollbar
  (set mod.heirline.scrollbar
       {:init (fn [self]
                (set self.current-line (get-current-line))
                (set self.total-lines (get-total-lines)))
        :static {:scrollbar-icons ["🭶" "🭷" "🭸" "🭹" "🭺" "🭻"]}
        :provider (fn [self]
                    (let [i (+ (math.floor (* (/ (- self.current-line 1)
                                                 self.total-lines)
                                              (length self.scrollbar-icons)))
                               1)
                          new-scrollbar (. self :scrollbar-icons i)]
                      (string.rep new-scrollbar 2)))
        :hl {:fg colors.purple}})
  ;; Custom Mode

  (fn mod.heirline.custom-mode [str]
    {:provider (.. " " str " ")
     :hl {:fg colors.black :bg colors.green :bold true}})

  mod)

