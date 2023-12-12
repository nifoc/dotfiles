(let [treesitter-config (require :nvim-treesitter.configs)
      nifoc-treesitter (require :nifoc.treesitter)
      disable-parsers []]
  (nifoc-treesitter.setup)
  (treesitter-config.setup {:ensure_installed []
                            :sync_install true
                            :auto_install false
                            :highlight {:enable true :disable disable-parsers}
                            :indent {:enable true :disable disable-parsers}
                            :matchup {:enable true :disable disable-parsers}
                            :autopairs {:enable true :disable disable-parsers}
                            :playground {:enable true}
                            :nifoc_hooks {:enable true
                                          :disable disable-parsers}
                            :textobjects {:select {:enable true
                                                   :lookahead true
                                                   :keymaps {:af {:query "@function.outer"
                                                                  :desc "Select outer part of a function"}
                                                             :if {:query "@function.inner"
                                                                  :desc "Select inner part of a function"}
                                                             :ac {:query "@class.outer"
                                                                  :desc "Select outer part of a class"}
                                                             :ic {:query "@class.inner"
                                                                  :desc "Select inner part of a class"}
                                                             :as {:query "@scope"
                                                                  :desc "Select language scope"}}}
                                          :swap {:enable true
                                                 :swap_next {:<leader>a {:query "@parameter.inner"
                                                                         :desc "Swap function parameter with the next one"}}
                                                 :swap_previous {:<leader>A {:query "@parameter.inner"
                                                                             :desc "Swap function parameter with the previous one"}}}
                                          :lsp_interop {:enable true
                                                        :border :rounded
                                                        :floating_preview_opts {}
                                                        :peek_definition_code {:<leader>lpf {:query "@function.outer"
                                                                                             :desc "Peek outer function definition"}
                                                                               :<leader>lpF {:query "@class.outer"
                                                                                             :desc "Peek outer class definition"}}}}}))
