(let [g vim.g]
  (set g.coq_settings
       {:auto_start :shut-up
        :display {:preview {:positions {:north 2 :south 3 :west 4 :east 1}}
                  :pum {:kind_context [" " ""]}
                  :icons {:mode :short
                          :mappings {:Text "󰉿"
                                     :Method "󰆧"
                                     :Function "󰊕"
                                     :Constructor ""
                                     :Field "󰜢"
                                     :Variable "󰀫"
                                     :Class "󰠱"
                                     :Interface ""
                                     :Module ""
                                     :Property "󰜢"
                                     :Unit "󰑭"
                                     :Value "󰎠"
                                     :Enum ""
                                     :Keyword "󰌋"
                                     :Snippet ""
                                     :Color "󰏘"
                                     :File "󰈙"
                                     :Reference "󰈇"
                                     :Folder "󰉋"
                                     :EnumMember ""
                                     :Constant "󰏿"
                                     :Struct "󰙅"
                                     :Event ""
                                     :Operator "󰆕"
                                     :TypeParameter ""}}}
        :clients {:tags.enabled false :tmux.enabled false}})
  (require :coq))
