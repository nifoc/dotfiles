(let [otter (require :otter)
      languages [:bash :markdown :lua]
      completion true
      diagnostics true
      tsquery nil
      enabled-filetypes [:elixir :markdown :nix]
      augroup (vim.api.nvim_create_augroup :NifocOtter {:clear true})
      aucmd vim.api.nvim_create_autocmd]
  (otter.setup {:buffers {:set_filetype true} :handle_leading_whitespace true})
  (each [_ ft (pairs enabled-filetypes)]
    (aucmd :FileType {:pattern ft
                      :callback #(otter.activate languages completion
                                                 diagnostics tsquery)
                      :group augroup
                      :desc "Setup Otter"})))
