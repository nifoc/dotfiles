(let [mod {}
      b vim.b
      api vim.api
      set-bufvar vim.api.nvim_buf_set_var]
  (fn mod.setup []
    (let [usercmd vim.api.nvim_create_user_command]
      (usercmd :FormatDisableBuffer mod.disable-for-buffer
               {:desc "Disable Formatting for the current buffer"})
      (usercmd :FormatEnableBuffer mod.enable-for-buffer
               {:desc "Enable Formatting for the current buffer"})))

  (fn notify [msg]
    (vim.notify msg vim.log.levels.INFO {:title :Formatter}))

  (fn has-formatter-config? [ft]
    (let [cfg (require :formatter.config)
          fts (cfg.get :filetype)]
      (not= (. fts ft) nil)))

  (fn mod.enable-for-buffer []
    (set-bufvar 0 :nifoc_formatter_disabled 0))

  (fn mod.disable-for-buffer []
    (set-bufvar 0 :nifoc_formatter_disabled 1))

  (fn mod.active? []
    (let [ft vim.bo.filetype]
      (if (= b.nifoc_formatter_disabled 1) false
          (has-formatter-config? ft))))

  (fn mod.maybe-enable-lsp [client bufnr]
    (when (client.supports_method :textDocument/rangeFormatting)
      (api.nvim_buf_set_option bufnr :formatexpr "v:lua.vim.lsp.formatexpr()")))

  mod)

