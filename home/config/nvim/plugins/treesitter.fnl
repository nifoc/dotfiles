(let [treesitter-config (require :nvim-treesitter.configs)
      nifoc-treesitter (require :nifoc.treesitter)
      disable-parsers []]
  (nifoc-treesitter.setup)
  (treesitter-config.setup {:ensure_installed []
                            :sync_install true
                            :auto_install false
                            :highlight {:enable true :disable disable-parsers}
                            :indent {:enable true :disable disable-parsers}
                            :textobjects {:select {:enable true
                                                   :disable disable-parsers
                                                   :keymaps {:af "@function.outer"
                                                             :if "@function.inner"
                                                             :ac "@conditional.outer"
                                                             :ic "@conditional.inner"}}}
                            :matchup {:enable true :disable disable-parsers}
                            :playground {:enable true}
                            :nifoc_hooks {:enable true
                                          :disable disable-parsers}}))
