(import-macros {: highlight-get-field} :../macros/cmd)

(let [mod {}
      api vim.api
      heirline-utils (require :heirline.utils)
      colors (. (require :nifoc.theme) :colors)
      statusline (require :nifoc.statusline)
      fg-active (highlight-get-field :TabLineSel :fg)
      fg-inactive (highlight-get-field :TabLine :fg)
      bg-active (highlight-get-field :TabLineSel :bg)
      bg-inactive (highlight-get-field :TabLine :bg)
      (ok-mini-files mini-files) (pcall require :mini.files)]
  ;; Utils
  (set mod.space
       {:provider " "
        :hl (fn [self]
              (if self.is_active {:bg bg-active} {:bg bg-inactive}))})
  (set mod.truncate-left {:provider "" :hl {:fg fg-inactive}})
  (set mod.truncate-right {:provider "" :hl {:fg fg-inactive}})
  ;; Filename
  (set mod.filename-block
       {:init (fn [self]
                (set self.filename (api.nvim_buf_get_name self.bufnr)))
        :hl (fn [self]
              (if self.is_active :TabLineSel :TabLine))
        :on_click {:name :heirline_tabline_buffer_callback
                   :callback (fn [_ minwid]
                               (api.nvim_win_set_buf 0 minwid))
                   :minwid (fn [self]
                             self.bufnr)}})
  (set mod.filename
       {:provider (fn [self]
                    (if (= self.filename "") "[No Name]"
                        (vim.fn.fnamemodify self.filename ":t")))
        :hl (fn [self]
              (let [visible (or self.is_active self.is_visible)]
                {:bold visible :italic visible}))})
  (set mod.file-flags [{:condition #(api.nvim_buf_get_option $1.bufnr :modified)
                        :provider " "
                        :hl {:fg colors.yellow}}
                       {:condition #(or (not (api.nvim_buf_get_option $1.bufnr
                                                                      :modifiable))
                                        (api.nvim_buf_get_option $1.bufnr
                                                                 :readonly))
                        :provider (fn [self]
                                    (if (= api.nvim_buf_get_option self.bufnr
                                           :terminal)
                                        " "
                                        " "))
                        :hl {:fg colors.orange}}])
  (set mod.filename-block
       (heirline-utils.insert mod.filename-block statusline.file-icon
                              mod.filename mod.file-flags))
  ;; Tabpages
  (set mod.tabpage
       {:provider #(.. "%" $1.tabnr "T " $1.tabnr " %T")
        :hl (fn [self]
              (if self.is_active :TabLineSel :TabLine))})
  ;; Buttons
  (set mod.close-button
       {:condition (fn [self]
                     (not (. vim :bo self.bufnr :modified)))
        :update [:WinNew :WinClosed :BufEnter]
        1 mod.space
        2 {:provider "󰅖"
           :hl (fn [self]
                 (if self.is_active {:fg fg-active :bg bg-active}
                     {:fg fg-inactive :bg bg-inactive}))
           :on_click {:name :heirline_tabline_close_buffer_callback
                      :callback (fn [_ minwid]
                                  (vim.schedule #(api.nvim_buf_delete minwid
                                                                      {:force false}))
                                  (vim.cmd.redrawtabline))
                      :minwid (fn [self]
                                self.bufnr)}}})
  (set mod.close-tabpage {:provider "%999X 󰅖 %X" :hl :TabLine})
  ;; Indicator
  (set mod.active-indicator
       {:provider (fn [self]
                    (if self.is_active "│ " "  "))
        :hl (fn [self]
              (if self.is_active {:fg colors.purple :bg bg-active :bold true}
                  {:fg fg-inactive :bg bg-inactive}))})
  (set mod.os-indicator {:static {:uname (. (vim.loop.os_uname) :sysname)
                                  :os {:Darwin "" :Linux ""}
                                  :os-color {:Darwin colors.white
                                             :Linux "#7ebae4"}}
                         :hl (fn [self]
                               (let [fg-color (. self :os-color self.uname)]
                                 {:fg fg-color :bg bg-active}))
                         1 {:provider "  "}
                         2 {:provider (fn [self]
                                        (. self :os self.uname))
                            :on_click {:name :heirline_tabline_os_indicator_callback
                                       :callback #(when ok-mini-files
                                                    (mini-files.open))}}
                         3 {:provider "  "}})
  ;; Block
  (set mod.buffer-block [mod.active-indicator
                         mod.filename-block
                         mod.close-button
                         mod.space])
  (set mod.tabpages-block {:condition #(>= (length (api.nvim_list_tabpages)) 2)
                           1 statusline.push-right
                           2 (heirline-utils.make_tablist mod.tabpage)
                           3 mod.close-tabpage})
  mod)
