(let [hover (require :hover)]
  (hover.setup {:init #(do
                         (require :hover.providers.lsp)
                         (require :hover.providers.diagnostic))
                :preview_opts {:border :single}
                :preview_window false
                :title true
                :mouse_providers []}))
