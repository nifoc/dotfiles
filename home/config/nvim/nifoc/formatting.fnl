(let [mod {}
      b vim.b
      api vim.api
      set-bufvar vim.api.nvim_buf_set_var
      format (require :format)]
  (fn mod.setup []
    (let [usercmd vim.api.nvim_create_user_command
          augroup (vim.api.nvim_create_augroup :NifocFormatting {:clear true})
          aucmd vim.api.nvim_create_autocmd]
      (usercmd :FormatDisableBuffer mod.disable-for-buffer
               {:desc "Disable Formatting for the current buffer"})
      (usercmd :FormatEnableBuffer mod.enable-for-buffer
               {:desc "Enable Formatting for the current buffer"})
      ;; (aucmd :BufWritePre
      ;;       {:callback mod.maybe-format-buffer
      ;;        :group augroup
      ;;        :desc "Run Formatter before saving"})
      ))

  (fn has-formatter-config? [ft]
    (let [cfg (. (require :format.static) :config)
          fts (. cfg :filetypes)]
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
          (has-formatter-config? ft))))

  (fn mod.maybe-enable-lsp [client bufnr]
    (when (client.supports_method :textDocument/rangeFormatting)
      (api.nvim_buf_set_option bufnr :formatexpr "v:lua.vim.lsp.formatexpr()")))

  (fn mod.maybe-format-buffer []
    (let [ft vim.bo.filetype]
      (if (= b.nifoc_formatter_disabled 1) nil
          (format-with-lsp? ft) (vim.lsp.buf.format)
          (has-formatter-config? ft) (format.format)
          nil)))

  mod)
