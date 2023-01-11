(let [gitsigns (require :gitsigns)
      set-bufvar vim.api.nvim_buf_set_var]
  (gitsigns.setup {:signs {:add {:hl :GitSignsAdd
                                 :text "│"
                                 :numhl :GitSignsAddNr
                                 :linehl :GitSignsAddLn}
                           :change {:hl :GitSignsChange
                                    :text "│"
                                    :numhl :GitSignsChangeNr
                                    :linehl :GitSignsChangeLn}
                           :delete {:hl :GitSignsDelete
                                    :text "_"
                                    :numhl :GitSignsDeleteNr
                                    :linehl :GitSignsDeleteLn}
                           :topdelete {:hl :GitSignsDelete
                                       :text "‾"
                                       :numhl :GitSignsDeleteNr
                                       :linehl :GitSignsDeleteLn}
                           :changedelete {:hl :GitSignsChange
                                          :text "~"
                                          :numhl :GitSignsChangeNr
                                          :linehl :GitSignsChangeLn}
                           :untracked {:hl :GitSignsUntracked
                                       :text "┆"
                                       :numhl :GitSignsUntrackedNr
                                       :linehl :GitSignsUntrackedLn}}
                   :numhl false
                   :linehl false
                   :diff_opts {:internal true}
                   :preview_config {:border :rounded}
                   :on_attach (fn [bufnr]
                                (set-bufvar bufnr :nifoc_gitsigns_enabled 1))}))

