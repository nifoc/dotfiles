(let [otter (require :otter)
      languages [:bash :lua]
      completion true
      diagnostics true
      tsquery nil
      enabled-filetypes [:elixir :nix]
      augroup (vim.api.nvim_create_augroup :NifocOtter {:clear true})
      aucmd vim.api.nvim_create_autocmd]
  (each [_ ft (pairs enabled-filetypes)]
    (aucmd :FileType {:pattern ft
                      :callback #(otter.activate languages completion
                                                 diagnostics tsquery)
                      :group augroup
                      :desc "Setup Otter"})))
