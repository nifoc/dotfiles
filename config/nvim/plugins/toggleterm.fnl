(let [toggleterm (require :toggleterm)]
  (toggleterm.setup {:shell vim.o.shell
                     :open_mapping :<C-t>
                     :close_on_exit true})
  (let [augroup (vim.api.nvim_create_augroup :NifocTerm {:clear true})
        aucmd vim.api.nvim_create_autocmd
        keymap (require :nifoc.keymap)]
    (aucmd :TermOpen {:pattern "term://*toggleterm#*"
                      :callback (fn [opts]
                                  (set vim.opt_local.number false)
                                  (set vim.opt_local.relativenumber false)
                                  (set vim.opt_local.cursorline false)
                                  (vim.api.nvim_buf_set_var opts.buf
                                                            :toggle_line_style 0)
                                  (keymap.terminal-open opts.buf))
                      :group augroup})))

