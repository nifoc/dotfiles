(let [lualine (require :lualine)
      ns (require :nifoc.statusline)]
  (lualine.setup {:options {:globalstatus true
                            :theme :dracula-nvim
                            :section_separators ""
                            :component_separators "|"
                            :icons_enabled true}
                  :sections {; Left
                             :lualine_a [:mode]
                             :lualine_b ["b:gitsigns_status"
                                         {1 :diagnostics
                                          :sources [:nvim_diagnostic]
                                          :symbols {:error " "
                                                    :warn " "
                                                    :info " "
                                                    :hint " "}}]
                             :lualine_c [ns.current-function]
                             ; Right
                             :lualine_x [:filetype
                                         ns.lsp-enabled?
                                         ns.treesitter-enabled?
                                         ns.fixer-enabled?
                                         ns.spell-enabled?]
                             :lualine_y [ns.current-line-percent]
                             :lualine_z [ns.line-column]}}))
