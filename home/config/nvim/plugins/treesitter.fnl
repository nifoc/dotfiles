(let [treesitter (require :nvim-treesitter)
      disable-parsers []]
  (treesitter.setup {:parser_install_dir _G.nvim_treesitter_parser_directory
                     :ensure_installed []
                     :sync_install false
                     :auto_install false
                     :highlight {:enable true :disable disable-parsers}
                     :indent {:enable true :disable disable-parsers}}))
