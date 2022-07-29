(let [bufferline (require :bufferline)]
  (bufferline.setup {:options {:show_close_icon false
                               :diagnostics :nvim_lsp
                               :diagnostics_indicator (lambda [count
                                                               ?level
                                                               ?diagnostics-dict
                                                               context]
                                                        (if (context.buffer:current)
                                                            ""
                                                            (.. " (" count ")")))}}))
