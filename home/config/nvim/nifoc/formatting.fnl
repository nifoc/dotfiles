(let [mod {}
      b vim.b
      cmd vim.cmd
      api vim.api
      set-bufvar vim.api.nvim_buf_set_var
      treefmt-exists (vim.fn.executable :treefmt)]
  (fn mod.setup []
    (let [usercmd vim.api.nvim_create_user_command
          augroup (vim.api.nvim_create_augroup :NifocFormatting {:clear true})
          aucmd vim.api.nvim_create_autocmd]
      (usercmd :FormatDisableBuffer mod.disable-for-buffer
               {:desc "Disable Formatting for the current buffer"})
      (usercmd :FormatEnableBuffer mod.enable-for-buffer
               {:desc "Enable Formatting for the current buffer"})
      (aucmd :BufWritePre
             {:callback mod.maybe-format-buffer-pre
              :group augroup
              :desc "Run Formatter before saving"})
      (aucmd :BufWritePost
             {:callback mod.maybe-format-buffer-post
              :group augroup
              :desc "Run Formatter after saving"})))

  (fn has-formatter-config? [ft]
    (let [formatter-fts (vim.tbl_keys (. (require :formatter.config) :values
                                         :filetype))]
      (vim.tbl_contains formatter-fts ft)))

  (fn has-treefmt-config? [ft]
    (and (= treefmt-exists 1) (has-formatter-config? ft)))

  (fn run-formatter-exe [] (cmd :FormatWriteLock))

  (fn run-lsp-format []
    (if (not= b.nifoc_formatter_filter_lsp_client nil)
        (vim.lsp.buf.format {:filter #(= $1.name
                                         b.nifoc_formatter_filter_lsp_client)
                             :timeout_ms 1000})
        (vim.lsp.buf.format {:timeout_ms 1000})))

  (fn mod.enable-for-buffer []
    (set-bufvar 0 :nifoc_formatter_disabled 0))

  (fn mod.disable-for-buffer []
    (set-bufvar 0 :nifoc_formatter_disabled 1))

  (fn mod.active? []
    (let [ft vim.bo.filetype]
      (if (= b.nifoc_formatter_disabled 1) false
          (= b.nifoc_lsp_formatter_enabled 1) true
          (has-formatter-config? ft) true
          false)))

  (fn mod.maybe-enable-lsp [client bufnr]
    (when (client.supports_method :textDocument/rangeFormatting)
      (api.nvim_buf_set_option bufnr :formatexpr "v:lua.vim.lsp.formatexpr()"))
    (when (client.supports_method :textDocument/formatting)
      (set-bufvar bufnr :nifoc_lsp_formatter_enabled 1)))

  (fn mod.maybe-format-buffer-pre []
    (let [ft vim.bo.filetype]
      (if (= b.nifoc_formatter_disabled 1) nil
          (has-treefmt-config? ft) nil
          (= b.nifoc_lsp_formatter_enabled 1) (run-lsp-format))))

  (fn mod.maybe-format-buffer-post []
    (let [ft vim.bo.filetype]
      (if (= b.nifoc_formatter_disabled 1) nil
          (has-treefmt-config? ft) (run-formatter-exe)
          (= b.nifoc_lsp_formatter_enabled 1) nil
          (has-formatter-config? ft) (run-formatter-exe))))

  mod)

