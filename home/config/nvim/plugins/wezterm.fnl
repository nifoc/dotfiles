(let [wezterm (require :wezterm)
      augroup (vim.api.nvim_create_augroup :NifocWezterm {:clear true})
      aucmd vim.api.nvim_create_autocmd]
  (wezterm.setup {:create_commands false})
  (aucmd :BufEnter {:callback (fn [args]
                                (let [path (vim.api.nvim_buf_get_name args.buf)
                                      name (vim.fs.basename path)
                                      title (if (and name (> (length name) 0))
                                                (.. "nvim " name)
                                                "")]
                                  (wezterm.set_tab_title title)))
                    :group augroup})
  (aucmd :VimLeavePre {:callback #(wezterm.set_tab_title "") :group augroup}))

