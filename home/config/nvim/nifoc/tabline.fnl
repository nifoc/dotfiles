(let [mod {}
      api vim.api
      heirline-utils (require :heirline.utils)
      dracula (require :dracula)
      colors (dracula.colors)
      statusline (require :nifoc.statusline)]
  ;; Utils
  (set mod.truncate-left {:provider "" :hl {:fg :gray}})
  (set mod.truncate-right {:provider "" :hl {:fg :gray}})
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
  (set mod.file-flags [{:provider (fn [self]
                                    (when (. vim :bo self.bufnr :modified)
                                      " "))
                        :hl {:fg colors.yellow}}
                       {:provider (fn [self]
                                    (when (or (not (. vim :bo self.bufnr
                                                      :modifiable))
                                              (. vim :bo self.bufnr :readonly))
                                      " "))
                        :hl {:fg colors.orange}}])
  (set mod.filename-block
       (heirline-utils.insert mod.filename-block statusline.file-icon
                              mod.filename mod.file-flags))
  ;; Buttons
  (set mod.close-button
       {:condition (fn [self]
                     (not (. vim :bo self.bufnr :modified)))
        1 statusline.space
        2 {:provider ""
           :hl {:fg :gray}
           :on_click {:name :heirline_tabline_close_buffer_callback
                      :callback (fn [_ minwid]
                                  (api.nvim_buf_delete minwid {:force false}))
                      :minwid (fn [self]
                                self.bufnr)}}})
  ;; Indicator
  (set mod.active-indicator
       {:provider (fn [self]
                    (if self.is_active "┃ " "  "))
        :hl {:fg colors.purple :bold true}})
  ;; Block
  (set mod.buffer-block
       (heirline-utils.surround [" " " "]
                                (fn [self]
                                  (if self.is_active
                                      (. (heirline-utils.get_highlight :TabLineSel)
                                         :bg)
                                      (. (heirline-utils.get_highlight :TabLine)
                                         :bg)))
                                [mod.active-indicator
                                 mod.filename-block
                                 mod.close-button]))
  mod)

