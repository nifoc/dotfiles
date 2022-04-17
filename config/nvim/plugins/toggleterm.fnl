(let [toggleterm (require :toggleterm)]
  (toggleterm.setup {:shell :fish :open_mapping :<C-t>})
  (let [augroup (vim.api.nvim_create_augroup :NifocTerm {:clear true})
        aucmd vim.api.nvim_create_autocmd]
    (aucmd :TermOpen {:callback (fn []
                                  (set vim.opt_local.number false)
                                  (set vim.opt_local.relativenumber false)
                                  (set vim.opt_local.cursorline false))
                      :group augroup})))
