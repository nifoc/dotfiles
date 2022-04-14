(let [cmp (require :cmp)
      snippy (require :snippy)
      lspkind (require :lspkind)
      npairs (require :nvim-autopairs.completion.cmp)]
  (fn has-words-before? []
    (let [(line col) (-> 0 (vim.api.nvim_win_get_cursor) (unpack))]
      (if (not= col 0)
          (let [line-content (vim.api.nvim_buf_get_lines 0 (- line 1) line true)
                cursor-content (: (. line-content 1) :sub col col)]
            (= (cursor-content:match "%s") nil))
          false)))

  (fn map-tab [fallback]
    (if (cmp.visible) (cmp.select_next_item)
        (snippy.can_expand_or_advance) (snippy.expand_or_advance)
        (has-words-before?) (cmp.complete)
        (fallback)))

  (fn map-stab [fallback]
    (if (cmp.visible) (cmp.select_prev_item)
        (snippy.can_jump -1) (snippy.previous)
        (fallback)))

  (cmp.setup {:sources (cmp.config.sources [{:name :nvim_lsp}
                                            {:name :snippy}
                                            {:name :nvim_lua}]
                                           [{:name :treesitter}
                                            {:name :buffer}
                                            {:name :path}])
              :mapping {:<C-e> (cmp.mapping {:i (cmp.mapping.abort)
                                             :c (cmp.mapping.close)})
                        :<Tab> (cmp.mapping {:c #(if (cmp.visible)
                                                     (cmp.select_next_item {:behavior cmp.SelectBehavior.Insert})
                                                     (cmp.complete))
                                             :i map-tab
                                             :s map-tab})
                        :<S-Tab> (cmp.mapping {:c #(if (cmp.visible)
                                                       (cmp.select_prev_item {:behavior cmp.SelectBehavior.Insert})
                                                       (cmp.complete))
                                               :i map-stab
                                               :s map-stab})
                        :<C-Space> (cmp.mapping.confirm {:behavior cmp.ConfirmBehavior.Insert
                                                         :select true})
                        :<CR> (cmp.mapping.confirm {:select true})}
              :completion {:keyword_length 2
                           :completeopt "menu,menuone,noinsert"}
              :window {:documentation {:border ["╭"
                                                "─"
                                                "╮"
                                                "│"
                                                "╯"
                                                "─"
                                                "╰"
                                                "│"]}}
              :snippet {:expand #(snippy.expand_snippet $1.body)}
              :formatting {:format (lspkind.cmp_format)}})
  (cmp.setup.cmdline "/"
                     {:sources (cmp.config.sources [{:name :nvim_lsp_document_symbol}]
                                                   [{:name :buffer}])})
  (cmp.setup.cmdline ":"
                     {:sources (cmp.config.sources [{:name :path}]
                                                   [{:name :cmdline}])})
  (cmp.event:on :confirm_done (npairs.on_confirm_done {:map_char {:tex ""}})))
