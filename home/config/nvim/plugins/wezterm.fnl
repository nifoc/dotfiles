(let [wezterm (require :wezterm)
      wezterm-exists (vim.fn.executable :wezterm)
      api vim.api
      augroup (api.nvim_create_augroup :NifocWezterm {:clear true})
      aucmd api.nvim_create_autocmd
      title-ignore-fts [:sh]]
  (when (= wezterm-exists 1)
    (fn update-tab-title [args]
      (let [path (api.nvim_buf_get_name args.buf)
            name (vim.fs.basename path)
            ft (api.nvim_buf_get_option args.buf :filetype)
            title (if (and name (> (length name) 0))
                      (.. "nvim " name)
                      "")]
        (when (not (vim.list_contains title-ignore-fts ft))
          (wezterm.set_tab_title title))))

    (wezterm.setup {:create_commands false})
    (aucmd :BufEnter {:callback (fn [args]
                                  (update-tab-title args))
                      :group augroup})
    (aucmd :FocusGained {:callback (fn [args]
                                     (update-tab-title args)
                                     (wezterm.set_user_var :enable-ligatures :t))
                         :group augroup})
    (aucmd :FocusLost {:callback #(wezterm.set_user_var :enable-ligatures :f)
                       :group augroup})
    (aucmd :VimEnter {:callback #(wezterm.set_user_var :enable-ligatures :t)
                      :group augroup})
    (aucmd :VimLeavePre {:callback (fn []
                                     (wezterm.set_user_var :enable-ligatures :f)
                                     (wezterm.set_tab_title ""))
                         :group augroup})))
