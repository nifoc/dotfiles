(let [cmp (require :cmp)
      luasnip (require :luasnip)
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
        (luasnip.expand_or_jumpable) (luasnip.expand_or_jump)
        (has-words-before?) (cmp.complete)
        (fallback)))

  (fn map-stab [fallback]
    (if (cmp.visible) (cmp.select_prev_item)
        (luasnip.jumpable -1) (luasnip.jump -1)
        (fallback)))

  (cmp.setup {:sources (cmp.config.sources [{:name :nvim_lsp}
                                            ;{:name :nvim_lsp_signature_help}
                                            {:name :luasnip}
                                            {:name :treesitter
                                             :keyword_length 3}
                                            {:name :buffer :keyword_length 3}
                                            {:name :path}])
              :mapping (cmp.mapping.preset.insert {:<C-e> (cmp.mapping {:i (cmp.mapping.abort)
                                                                        :c (cmp.mapping.close)})
                                                   :<esc> (cmp.mapping {:i (cmp.mapping.abort)})
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
                                                   :<CR> (cmp.mapping.confirm {:select true})})
              :window {:documentation (cmp.config.window.bordered)}
              :completion {:keyword_length 2
                           :completeopt "menu,menuone,noinsert"}
              :snippet {:expand (fn [args]
                                  (luasnip.lsp_expand args.body))}
              :formatting {:format (lspkind.cmp_format {:mode :symbol_text
                                                        :menu {:buffer "[Buffer]"
                                                               :cmdline "[Cmd]"
                                                               :luasnip "[LuaSnip]"
                                                               :nvim_lsp "[LSP]"
                                                               :nvim_lsp_document_symbol "[Symbol]"
                                                               :nvim_lua "[Lua]"
                                                               :path "[Path]"}})}})
  (cmp.setup.cmdline "/"
                     {:sources (cmp.config.sources [{:name :nvim_lsp_document_symbol}]
                                                   [{:name :buffer}])
                      :mapping (cmp.mapping.preset.cmdline)})
  (cmp.setup.cmdline ":"
                     {:sources (cmp.config.sources [{:name :path}]
                                                   [{:name :cmdline}])
                      :mapping (cmp.mapping.preset.cmdline)})
  (cmp.event:on :confirm_done (npairs.on_confirm_done)))
