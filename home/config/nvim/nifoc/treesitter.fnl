(let [mod {}
      (ok treesitter) (pcall require :nvim-treesitter)
      set-bufvar vim.api.nvim_buf_set_var]
  (fn mod.setup []
    (if ok
        (treesitter.define_modules {:nifoc_hooks {:enable false
                                                  :attach (lambda [bufnr]
                                                            (set-bufvar bufnr
                                                                        :nifoc_treesitter_enabled
                                                                        1))
                                                  :detach (lambda [bufnr]
                                                            (set-bufvar bufnr
                                                                        :nifoc_treesitter_enabled
                                                                        0))
                                                  :is_supported #true}})))

  (fn mod.active? []
    (= vim.b.nifoc_treesitter_enabled 1))

  mod)
