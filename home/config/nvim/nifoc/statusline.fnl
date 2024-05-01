(import-macros {: deferred_cmd} :../macros/cmd)

(let [mod {}
      api vim.api
      heirline-utils (require :heirline.utils)
      heirline-conditions (require :heirline.conditions)
      web-devicons (require :nvim-web-devicons)
      colors (. (require :nifoc.theme) :colors)
      formatting (require :nifoc.formatting)
      repo (require :nifoc.repo)
      nifoc-treesitter (require :nifoc.treesitter)
      navic (require :nvim-navic)
      neogit (require :neogit)]
  (fn buffer-variable-exists? [key]
    (not= (. vim :b key) nil))

  (fn get-current-line []
    (let [cl (api.nvim_win_get_cursor 0)]
      (. cl 1)))

  (fn get-total-lines []
    (api.nvim_buf_line_count 0))

  (fn max-number [nums]
    (math.max (unpack nums)))

  (fn truncate-string [str max-length ellipsis]
    (if (> (length str) max-length) (.. (str:sub 1 max-length) ellipsis) str))

  ;; Utils
  (set mod.default-hl #{:bg colors.black})
  (set mod.space {:provider " "})
  (set mod.spacer {:provider " " :hl {:fg colors.bg :bg colors.bg}})
  (set mod.push-right {:provider "%="})
  (set mod.space-if-count {:condition #(> $1.check-count 0) :provider " "})
  (set mod.space-if-length {:condition #(> $1.check-length 0) :provider " "})
  (set mod.space-if-count-or-length
       {:condition #(or (> $1.check-count 0) (> $1.check-length 0))
        :provider " "})
  ;; Mode
  (set mod.vi-mode {:init #(set $1.mode (. (api.nvim_get_mode) :mode))
                    :update {1 :ModeChanged
                             :pattern "*:*"
                             :callback (vim.schedule_wrap #(vim.cmd.redrawstatus))}
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
  (set mod.filetype-block {:init #(set $1.filename (api.nvim_buf_get_name 0))})
  (set mod.file-icon {:init (fn [self]
                              (let [filename self.filename
                                    ext (vim.fn.fnamemodify filename ":e")
                                    (icon color) (web-devicons.get_icon_color filename
                                                                              ext
                                                                              {:default true})]
                                (set self.icon icon)
                                (set self.icon-color color)))
                      :provider #(when $1.icon
                                   (.. $1.icon " "))
                      :hl #{:fg $1.icon-color}})
  (set mod.filetype {:provider #(let [ft vim.bo.filetype]
                                  (if (> (ft:len) 0) ft "no ft"))
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
  (set mod.git
       {:condition heirline-conditions.is_git_repo
        :static {:git-repo-icons {:github ""
                                  :gitlab ""
                                  :forgejo ""
                                  :default ""}}
        :init (fn [self]
                (let [git-status vim.b.gitsigns_status_dict]
                  (set self.git-repo-icon (. self :git-repo-icons repo.type))
                  (set self.git-head git-status.head)
                  (set self.git-added (or git-status.added 0))
                  (set self.git-removed (or git-status.removed 0))
                  (set self.git-changed (or git-status.changed 0))
                  (set self.check-count
                       (max-number [self.git-added
                                    self.git-removed
                                    self.git-changed]))
                  (set self.check-length (length self.git-head))))
        1 mod.space-if-count-or-length
        2 {:provider #(.. " " $1.git-repo-icon " ")
           :on_click {:name :heirline_git_repo_type
                      :callback #(repo.open-repo)}
           :hl {:fg colors.black :bg colors.orange :bold true}}
        3 {:provider #(.. $1.git-head " ")
           :on_click {:name :heirline_git_branch
                      :callback #(neogit.open {:kind :split})}
           :hl {:fg colors.black :bg colors.orange :bold true}}
        4 mod.space
        5 {:provider #(.. " " $1.git-added " ")
           :hl {:fg colors.bright_green}}
        6 {:provider #(.. " " $1.git-removed " ")
           :hl {:fg colors.bright_red}}
        7 {:provider #(.. " " $1.git-changed) :hl {:fg colors.cyan}}})
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
                                                      {:severity d.severity.HINT})))
                                  (set self.check-count
                                       (max-number [self.errors
                                                    self.warnings
                                                    self.info
                                                    self.hints]))))
                        :update [:DiagnosticChanged :BufEnter]
                        1 mod.space-if-count
                        2 {:provider (fn [self]
                                       (let [spacer (if (or (> self.warnings 0)
                                                            (> self.info 0)
                                                            (> self.hints 0))
                                                        " "
                                                        "")]
                                         (when (> self.errors 0)
                                           (.. " " self.errors spacer))))
                           :hl {:fg colors.red}}
                        3 {:provider (fn [self]
                                       (let [spacer (if (or (> self.info 0)
                                                            (> self.hints 0))
                                                        " "
                                                        "")]
                                         (when (> self.warnings 0)
                                           (.. " " self.warnings spacer))))
                           :hl {:fg colors.yellow}}
                        4 {:provider (fn [self]
                                       (let [spacer (if (> self.hints 0) " "
                                                        "")]
                                         (when (> self.info 0)
                                           (.. " " self.info spacer))))
                           :hl {:fg colors.cyan}}
                        5 {:provider (fn [self]
                                       (when (> self.hints 0)
                                         (.. "󰅺 " self.hints)))
                           :hl {:fg colors.cyan}}})
  ;; Current Function
  (set mod.current-function
       {:condition heirline-conditions.lsp_attached
        :init #(if (navic.is_available)
                   (set $1.check-length 1)
                   (set $1.check-length 0))
        :update :CursorMoved
        1 mod.space-if-length
        2 {:provider #(string.gsub (navic.get_location) "%%" "%%%%")
           :hl {:fg colors.white}}})
  (set mod.navic
       {:condition #(navic.is_available 0)
        :static {:type-hl {:File :Directory
                           :Module "@include"
                           :Namespace "@namespace"
                           :Package "@include"
                           :Class "@structure"
                           :Method "@method"
                           :Property "@property"
                           :Field "@field"
                           :Constructor "@constructor"
                           :Enum "@field"
                           :Interface "@type"
                           :Function "@function"
                           :Variable "@variable"
                           :Constant "@constant"
                           :String "@string"
                           :Number "@number"
                           :Boolean "@boolean"
                           :Array "@field"
                           :Object "@type"
                           :Key "@keyword"
                           :Null "@comment"
                           :EnumMember "@field"
                           :Struct "@structure"
                           :Event "@keyword"
                           :Operator "@operator"
                           :TypeParameter "@type"}
                 :separator "  "
                 :enc (fn [line col winnr]
                        (let [enc-line (bit.lshift line 16)
                              enc-col (bit.lshift col 6)]
                          (bit.bor enc-line enc-col winnr)))
                 :dec (fn [c]
                        (let [line (bit.rshift c 16)
                              col (-> c (bit.rshift 6) (bit.band 1023))
                              winnr (bit.band c 63)]
                          [line col winnr]))}
        :init (fn [self]
                (set self.check-length 1)
                (local data (or (navic.get_data) []))
                (local data-len (length data))
                (var children [])
                (each [i d (ipairs data)]
                  (let [pos (self.enc d.scope.start.line
                                      d.scope.start.character self.winnr)
                        child [{:provider d.icon :hl (. self.type-hl d.type)}
                               {:provider (truncate-string (string.gsub d.name
                                                                        "%%"
                                                                        "%%%%")
                                                           45 "󰇘")
                                :on_click {:name :heirline_navic
                                           :minwid pos
                                           :callback (fn [_ minwid]
                                                       (let [[line col winnr] (self.dec minwid)
                                                             id (vim.fn.win_getid winnr)]
                                                         (api.nvim_win_set_cursor id
                                                                                  [line
                                                                                   col])))}}]]
                    (when (and (> data-len 1) (< i data-len))
                      (table.insert child
                                    {:provider self.separator
                                     :hl {:fg colors.white}}))
                    (table.insert children child)))
                (set self.child (self:new children 1)))
        :update :CursorMoved
        1 mod.space-if-length
        2 {:provider #(: $1.child :eval) :hl {:fg colors.white}}})
  ;; Buffer Options
  (set mod.buffer-options
       {:static {:format {:dos "" :unix "" :mac ""}}
        :hl {:fg colors.black :bg colors.orange}
        1 mod.space
        2 {:condition #(buffer-variable-exists? :nifoc_lsp_enabled)
           :provider " "
           :on_click {:name :heirline_buffer_options_lsp
                      :callback #(deferred_cmd {:cmd :LspInfo} 200)}}
        3 {:condition #(formatting.active?) :provider "󰉼 "}
        4 {:condition #(nifoc-treesitter.active?) :provider " "}
        5 {:condition #vim.wo.spell :provider "󰓆"}
        6 {:provider (fn [self]
                       (let [f vim.bo.fileformat]
                         (.. (. self :format f) " ")))}})
  ;; Position
  (set mod.position
       {:init (fn [self]
                (let [pos (api.nvim_win_get_cursor 0)]
                  (set self.position-line (tostring (. pos 1)))
                  (set self.position-column (tostring (. pos 2)))))
        :provider #(string.format " %3s:%-3s " $1.position-line
                                  $1.position-column)
        :hl {:fg colors.black :bg colors.purple :bold true}})
  ;; Scrollbar
  (set mod.scrollbar {:init (fn [self]
                              (set self.current-line (get-current-line))
                              (set self.total-lines (get-total-lines)))
                      :static {:scrollbar-icons-block ["▁"
                                                       "▂"
                                                       "▃"
                                                       "▄"
                                                       "▅"
                                                       "▆"
                                                       "▇"
                                                       "█"]
                               :scrollbar-icons-line ["🭶"
                                                      "🭷"
                                                      "🭸"
                                                      "🭹"
                                                      "🭺"
                                                      "🭻"]}
                      :provider (fn [self]
                                  (let [scrollbar-icons self.scrollbar-icons-block
                                        i (+ (math.floor (* (/ (- self.current-line
                                                                  1)
                                                               self.total-lines)
                                                            (length scrollbar-icons)))
                                             1)
                                        new-scrollbar (. scrollbar-icons i)]
                                    (string.rep new-scrollbar 2)))
                      :hl {:fg colors.purple}})
  ;; Search count
  (set mod.search-count
       {:condition #(> vim.v.hlsearch 0)
        :init #(set $1.count (vim.fn.searchcount {:timeout 5}))
        :provider #(string.format "[%s/%s]" $1.count.current $1.count.total)
        :hl {:fg colors.black :bg colors.purple}})
  ;; Command
  (set mod.command
       {:condition (fn [self]
                     (let [mode (. (api.nvim_get_mode) :mode)]
                       (vim.tbl_contains self.enabled-modes mode)))
        :update {1 :ModeChanged :pattern "*:*"}
        :static {:enabled-modes [:no
                                 :nov
                                 :noV
                                 "no\022"
                                 :v
                                 :vs
                                 :V
                                 :Vs
                                 "\022"
                                 "\022s"]}
        :provider "[%S]"
        :hl {:fg colors.black :bg colors.purple}})
  ;; Custom Mode

  (fn mod.custom-mode [str fg bg]
    {:provider (.. " " str " ")
     :hl {:fg (. colors fg) :bg (. colors bg) :bold true}})

  (fn mod.shell-mode [fg bg]
    {:provider #(.. " " vim.b.nifoc_shell_mode " ")
     :hl {:fg (. colors fg) :bg (. colors bg) :bold true}})

  mod)
