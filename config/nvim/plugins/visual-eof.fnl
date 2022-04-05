(let [visual-eof (require :visual-eof)]
  (visual-eof.setup {:text_EOL "↵"
                     :text_NOEOL "✗↵"
                     :ft_ng [:git.* :LspTrouble :netrw :TelescopePrompt]
                     :buf_filter (lambda [bufnr]
                                   (let [disable_buftypes [:terminal :nofile]
                                         buftype (vim.api.nvim_buf_get_option bufnr
                                                                              :buftype)]
                                     (not (vim.tbl_contains disable_buftypes
                                                            buftype))))}))
