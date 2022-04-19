(let [mod {}
      b vim.b
      cmd vim.cmd
      api vim.api]
  (fn mod.setup []
    (let [augroup (vim.api.nvim_create_augroup :NifocFormatting {:clear true})
          aucmd vim.api.nvim_create_autocmd]
      (aucmd :BufWritePre {:callback mod.maybe-format-buffer :group augroup})))

  (fn mod.maybe-enable-lsp [client bufnr]
    (when client.server_capabilities.documentRangeFormattingProvider
      (api.nvim_buf_set_option bufnr :formatexpr "v:lua.vim.lsp.formatexpr()"))
    (when client.server_capabilities.documentFormattingProvider
      (api.nvim_buf_set_var bufnr :nifoc_lsp_formatter_enabled 1)))

  (fn mod.maybe-format-buffer []
    (let [formatprg (vim.opt_local.formatprg:get)
          formatprg-exe (-> formatprg (vim.split " " {:trimempty true}) (. 1))]
      (if (= b.nifoc_lsp_formatter_enabled 1)
          (vim.lsp.buf.formatting_sync nil 1000)
          (not= formatprg-exe nil)
          (cmd (.. "undojoin | Neoformat " formatprg-exe)))))

  mod)

