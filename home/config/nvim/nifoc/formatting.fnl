(let [mod {}
      b vim.b
      api vim.api
      set-bufvar vim.api.nvim_buf_set_var
      conform (require :conform)]
  (fn mod.setup []
    (let [usercmd api.nvim_create_user_command
          augroup (api.nvim_create_augroup :NifocFormatting {:clear true})
          aucmd api.nvim_create_autocmd]
      (usercmd :FormatDisableBuffer mod.disable-for-buffer
               {:desc "Disable Formatting for the current buffer"})
      (usercmd :FormatEnableBuffer mod.enable-for-buffer
               {:desc "Enable Formatting for the current buffer"})
      (aucmd :BufWritePre
             {:pattern "*"
              :callback #(mod.maybe-format-buffer $1.buf)
              :group augroup
              :desc "Run Formatter before saving"})))

  (fn has-formatter-config? [ft]
    (let [fts conform.formatters_by_ft]
      (not= (. fts ft) nil)))

  (fn format-with-lsp? [ft]
    (let [fts [:elixir]]
      (vim.list_contains fts ft)))

  (fn mod.enable-for-buffer []
    (set-bufvar 0 :nifoc_formatter_disabled 0))

  (fn mod.disable-for-buffer []
    (set-bufvar 0 :nifoc_formatter_disabled 1))

  (fn mod.active? []
    (let [ft vim.bo.filetype]
      (if (= b.nifoc_formatter_disabled 1) false
          (or (has-formatter-config? ft) (format-with-lsp? ft)))))

  (fn mod.maybe-format-buffer [bufnr]
    (let [ft vim.bo.filetype]
      (if (= b.nifoc_formatter_disabled 1) nil
          (conform.format {: bufnr
                           :async false
                           :timeout_ms 1000
                           :lsp_fallback (format-with-lsp? ft)}))))

  mod)
