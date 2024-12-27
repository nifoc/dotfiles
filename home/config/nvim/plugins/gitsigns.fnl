(let [gitsigns (require :gitsigns)
      set-bufvar vim.api.nvim_buf_set_var]
  (gitsigns.setup {:signs {:add {:text "│"}
                           :change {:text "│"}
                           :delete {:text "_"}
                           :topdelete {:text "‾"}
                           :changedelete {:text "~"}
                           :untracked {:text "┆"}}
                   :numhl false
                   :linehl false
                   :preview_config {:border :rounded}
                   :on_attach (fn [bufnr]
                                (set-bufvar bufnr :nifoc_gitsigns_enabled 0))}))
