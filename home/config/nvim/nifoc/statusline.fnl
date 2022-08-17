(import-macros {: deferred_cmd} :../macros/cmd)

(let [mod {}
      api vim.api
      heirline-utils (require :heirline.utils)
      heirline-conditions (require :heirline.conditions)
      web-devicons (require :nvim-web-devicons)
      dracula (require :dracula)
      colors (dracula.colors)
      formatting (require :nifoc.formatting)
      nifoc-treesitter (require :nifoc.treesitter)
      neogit (require :neogit)]
  (fn buffer-variable-exists? [key]
    (not= (. vim :b key) nil))

  (fn get-current-line []
    (let [cl (api.nvim_win_get_cursor 0)]
      (. cl 1)))

  (fn get-total-lines []
    (api.nvim_buf_line_count 0))

  ;; Utils
  (set mod.default-hl (fn []
                        {:bg colors.black}))
  (set mod.space {:provider " "})
  (set mod.spacer {:provider " " :hl {:fg colors.bg :bg colors.bg}})
  (set mod.push-right {:provider "%="})

  (fn mod.insert-left-unless-empty [item left]
    {:after (fn [self]
              (if (and (not= self.stl nil) (> (length self.stl) 0))
                  (set self.stl (.. left self.stl))))
     1 item})

  (fn mod.insert-right-unless-empty [item right]
    {:after (fn [self]
              (if (and (not= self.stl nil) (> (length self.stl) 0))
                  (set self.stl (.. self.stl right))))
     1 item})

  ;; Mode
  (set mod.vi-mode {:init (fn [self]
                            (let [mode (. (api.nvim_get_mode) :mode)]
                              (set self.mode mode)))
                    :update :ModeChanged
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
                             :mode-hl {:n {:fg colors.black
                                           :bg colors.purple
                                           :bold true}
                                       :i {:fg colors.black
                                           :bg colors.green
                                           :bold true}
                                       :v {:fg colors.black
                                           :bg colors.pink
                                           :bold true}
                                       :V {:fg colors.black
                                           :bg colors.pink
                                           :bold true}
                                       "\022" {:fg colors.black
                                               :bg colors.pink
                                               :bold true}
                                       :c {:fg colors.black
                                           :bg colors.yellow
                                           :bold true}
                                       :s {:fg colors.black
                                           :bg colors.orange
                                           :bold true}
                                       :S {:fg colors.black
                                           :bg colors.orange
                                           :bold true}
                                       "\019" {:fg colors.black
                                               :bg colors.orange
                                               :bold true}
                                       :R {:fg colors.black
                                           :bg colors.yellow
                                           :bold true}
                                       :r {:fg colors.black
                                           :bg colors.yellow
                                           :bold true}
                                       :! {:fg colors.black
                                           :bg colors.purple
                                           :bold true}
                                       :t {:fg colors.black
                                           :bg colors.purple
                                           :bold true}}}
                    :provider #(.. " " (. $1 :mode-names $1.mode) " ")
                    :hl (fn [self]
                          (let [short-mode (self.mode:sub 1 1)]
                            (. self :mode-hl short-mode)))})
  ;; Filetype
  (set mod.filetype-block
       {:init (fn [self]
                (set self.filename (api.nvim_buf_get_name 0)))})
  (set mod.file-icon {:init (fn [self]
                              (let [filename self.filename
                                    ext (vim.fn.fnamemodify filename ":e")
                                    (icon color) (web-devicons.get_icon_color filename
                                                                              ext
                                                                              {:default true})]
                                (set self.icon icon)
                                (set self.icon-color color)))
                      :provider (fn [self]
                                  (when self.icon
                                    (.. self.icon " ")))
                      :hl (fn [self]
                            {:fg self.icon-color})})
  (set mod.filetype {:provider (fn []
                                 (let [ft vim.bo.filetype]
                                   (if (> (ft:len) 0) ft "no ft")))
                     :hl {:fg colors.white}})
  (set mod.encoding {:provider (fn []
                                 (let [vim-enc (if (not= vim.bo.fenc nil)
                                                   vim.bo.fenc
                                                   vim.o.enc)
                                       enc (if (> (vim-enc:len) 0) vim-enc
                                               "no enc")]
                                   (.. enc " ")))
                     :hl {:fg colors.white}})
  (set mod.filetype-block
       (heirline-utils.insert mod.filetype-block mod.file-icon mod.filetype
                              {:provider " | " :hl {:fg colors.white}}
                              mod.encoding))
  ;; git
  (set mod.git {:condition heirline-conditions.is_git_repo
                :init (fn [self]
                        (let [git-status vim.b.gitsigns_status_dict]
                          (set self.git-head git-status.head)
                          (set self.git-added (or git-status.added 0))
                          (set self.git-removed (or git-status.removed 0))
                          (set self.git-changed (or git-status.changed 0))))
                1 {:provider #(.. "  " $1.git-head " ")
                   :hl {:fg colors.black :bg colors.orange :bold true}
                   :on_click {:name :heirline_git_branch
                              :callback #(neogit.open {:kind :split})}}
                2 {:provider " "}
                3 {:provider (fn [self]
                               (.. " " self.git-added " "))
                   :hl {:fg colors.bright_green}}
                4 {:provider (fn [self]
                               (.. " " self.git-removed " "))
                   :hl {:fg colors.bright_red}}
                5 {:provider (fn [self]
                               (.. " " self.git-changed))
                   :hl {:fg colors.cyan}}})
  ;; Diagnostics
  (set mod.diagnostics {:condition heirline-conditions.has_diagnostics
                        :init (fn [self]
                                (let [d vim.diagnostic]
                                  (set self.errors
                                       (length (d.get 0
                                                      {:severity d.severity.ERROR})))
                                  (set self.warnings
                                       (length (d.get 0
                                                      {:severity d.severity.WARN})))
                                  (set self.info
                                       (length (d.get 0
                                                      {:severity d.severity.INFO})))
                                  (set self.hints
                                       (length (d.get 0
                                                      {:severity d.severity.HINT})))))
                        :update [:DiagnosticChanged :BufEnter]
                        1 {:provider (fn [self]
                                       (let [spacer (if (or (> self.warnings 0)
                                                            (> self.info 0)
                                                            (> self.hints 0))
                                                        " " "")]
                                         (when (> self.errors 0)
                                           (.. " " self.errors spacer))))
                           :hl {:fg colors.red}}
                        2 {:provider (fn [self]
                                       (let [spacer (if (or (> self.info 0)
                                                            (> self.hints 0))
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
  (set mod.current-function
       {:condition heirline-conditions.lsp_attached
        :provider (fn []
                    (let [ctx vim.b.nifoc_lsp_current_context]
                      (when (and (not= ctx nil) (> (ctx:len) 0))
                        ctx)))
        :hl {:fg colors.white}})
  ;; Buffer Options
  (set mod.buffer-options
       {:static {:format {:dos "" :unix "" :mac ""}}
        :hl {:fg colors.black :bg colors.orange}
        1 {:provider " "}
        2 {:condition #(buffer-variable-exists? :nifoc_lsp_enabled)
           :provider " "
           :on_click {:name :heirline_buffer_options_lsp
                      :callback #(deferred_cmd {:cmd :LspInfo} 200)}}
        3 {:condition #(formatting.active?) :provider " "}
        4 {:condition #(nifoc-treesitter.active?) :provider " "}
        5 {:condition #vim.wo.spell :provider "暈"}
        6 {:provider (fn [self]
                       (let [f vim.bo.fileformat]
                         (.. (. self :format f) " ")))}})
  ;; Position
  (set mod.position
       {:init (fn [self]
                (let [pos (api.nvim_win_get_cursor 0)]
                  (set self.position-line (tostring (. pos 1)))
                  (set self.position-column (tostring (. pos 2)))))
        :provider (fn [self]
                    (string.format " %3s:%-3s " self.position-line
                                   self.position-column))
        :hl {:fg colors.black :bg colors.purple :bold true}})
  ;; Scrollbar
  (set mod.scrollbar {:init (fn [self]
                              (set self.current-line (get-current-line))
                              (set self.total-lines (get-total-lines)))
                      :static {:scrollbar-icons ["🭶"
                                                 "🭷"
                                                 "🭸"
                                                 "🭹"
                                                 "🭺"
                                                 "🭻"]}
                      :provider (fn [self]
                                  (let [i (+ (math.floor (* (/ (- self.current-line
                                                                  1)
                                                               self.total-lines)
                                                            (length self.scrollbar-icons)))
                                             1)
                                        new-scrollbar (. self :scrollbar-icons
                                                         i)]
                                    (string.rep new-scrollbar 2)))
                      :hl {:fg colors.purple}})
  ;; Search count
  (set mod.search-count
       {:condition #(> vim.v.hlsearch 0)
        :init (fn [self]
                (set self.count (vim.fn.searchcount {:timeout 5})))
        :provider (fn [self]
                    (string.format "[%s/%s]" self.count.current
                                   self.count.total))
        :hl {:fg colors.black :bg colors.purple}})
  ;; Custom Mode

  (fn mod.custom-mode [str fg bg]
    {:provider (.. " " str " ")
     :hl {:fg (. colors fg) :bg (. colors bg) :bold true}})

  (fn mod.shell-mode [fg bg]
    {:provider (fn []
                 (.. " " vim.b.nifoc_shell_mode " "))
     :hl {:fg (. colors fg) :bg (. colors bg) :bold true}})

  mod)

