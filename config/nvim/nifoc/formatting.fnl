(let [mod {}
      b vim.b
      cmd vim.cmd
      api vim.api
      set-bufvar vim.api.nvim_buf_set_var]
  (fn mod.setup []
    (let [usercmd vim.api.nvim_create_user_command
          augroup (vim.api.nvim_create_augroup :NifocFormatting {:clear true})
          aucmd vim.api.nvim_create_autocmd]
      (usercmd :FormatDisableBuffer mod.disable-for-buffer
               {:desc "Disable Formatting for the current buffer"})
      (usercmd :FormatEnableBuffer mod.enable-for-buffer
               {:desc "Enable Formatting for the current buffer"})
      (aucmd :BufWritePre {:callback mod.maybe-format-buffer
                           :group augroup
                           :desc "Run Formatter"})))

  (fn mod.enable-for-buffer []
    (set-bufvar 0 :nifoc_formatter_disabled 0))

  (fn mod.disable-for-buffer []
    (set-bufvar 0 :nifoc_formatter_disabled 1))

  (fn mod.maybe-enable-lsp [client bufnr]
    (when client.server_capabilities.documentRangeFormattingProvider
      (api.nvim_buf_set_option bufnr :formatexpr "v:lua.vim.lsp.formatexpr()"))
    (when client.server_capabilities.documentFormattingProvider
      (set-bufvar bufnr :nifoc_lsp_formatter_enabled 1)))

  (fn mod.maybe-format-buffer []
    (let [formatprg (vim.opt_local.formatprg:get)
          formatprg-exe (-> formatprg (vim.split " " {:trimempty true}) (. 1))]
      (if (= b.nifoc_formatter_disabled 1) nil
          (= b.nifoc_lsp_formatter_enabled 1) (vim.lsp.buf.format {:timeout_ms 1000})
          (not= formatprg-exe nil) (let [neoformat (.. "Neoformat "
                                                       formatprg-exe)]
                                     (cmd (.. "try | undojoin | " neoformat
                                              " | catch /E790/ | " neoformat
                                              " | endtry"))))))

  mod)

