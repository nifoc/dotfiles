(let [gitsigns (require :gitsigns)
      ns (require :nifoc.statusline)]
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
                                          :linehl :GitSignsChangeLn}}
                   :numhl false
                   :linehl false
                   :status_formatter ns.gitsigns-formatter
                   :diff_opts {:internal true}}))
