(let [wezterm (require :wezterm)
      wezterm-exists (vim.fn.executable :wezterm)
      augroup (vim.api.nvim_create_augroup :NifocWezterm {:clear true})
      aucmd vim.api.nvim_create_autocmd]
  (when (= wezterm-exists 1)
    (wezterm.setup {:create_commands false})
    (aucmd [:BufEnter :FocusGained]
           {:callback (fn [args]
                        (let [path (vim.api.nvim_buf_get_name args.buf)
                              name (vim.fs.basename path)
                              title (if (and name (> (length name) 0))
                                        (.. "nvim " name)
                                        "")]
                          (wezterm.set_tab_title title)))
            :group augroup})
    (aucmd [:BufLeave :FocusLost]
           {:callback #(wezterm.set_tab_title "") :group augroup})
    (aucmd :VimEnter {:callback #(wezterm.set_user_var :enable-ligatures :t)
                      :group augroup})
    (aucmd :VimLeavePre {:callback (fn []
                                     (wezterm.set_user_var :enable-ligatures :f)
                                     (wezterm.set_tab_title ""))
                         :group augroup})))
