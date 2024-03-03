(let [cmp (require :cmp)
      luasnip (require :luasnip)
      lspkind (require :lspkind)
      npairs (require :nvim-autopairs.completion.cmp)]
  (fn main-sources []
    (let [maybe-tabnine (if (pcall require :cmp_tabnine.config)
                            [{:name :cmp_tabnine}]
                            [])]
      (vim.list_extend (vim.list_extend [{:name :nvim_lsp}] maybe-tabnine)
                       [{:name :async_path} {:name :luasnip}])))

  (fn comparator-list []
    (let [compare (require :cmp.config.compare)
          maybe-tabnine (if (pcall require :cmp_tabnine.compare)
                            [(require :cmp_tabnine.compare)]
                            [])]
      (vim.list_extend (vim.list_extend [compare.offset
                                         compare.exact
                                         compare.score]
                                        maybe-tabnine)
                       [compare.recently_used
                        compare.locality
                        compare.kind
                        compare.length
                        compare.order])))

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

  (cmp.setup {:sources (cmp.config.sources (main-sources)
                                           [{:name :treesitter
                                             :keyword_length 3}
                                            {:name :buffer}])
              :sorting {:priority_weight 2 :comparators (comparator-list)}
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
              :window {:completion {:winhighlight "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:CmpCursorLine,Search:None"
                                    :col_offset -3
                                    :side_padding 0
                                    :scrollbar true}
                       :documentation (cmp.config.window.bordered)}
              :view {:entries {:name :custom :selection_order :near_cursor}}
              :completion {:keyword_length 2
                           :completeopt "menu,menuone,noinsert"}
              :snippet {:expand (fn [args]
                                  (luasnip.lsp_expand args.body))}
              :formatting {:fields [:kind :abbr :menu]
                           :format (fn [entry vim-item]
                                     (let [kind-fn (lspkind.cmp_format {:mode :symbol_text
                                                                        :maxwidth 50})
                                           kind (kind-fn entry vim-item)
                                           strings (vim.split kind.kind "%s"
                                                              {:trimempty true})]
                                       (if (= entry.source.name :cmp_tabnine)
                                           (do
                                             (set kind.kind " 󱜚 ")
                                             (set kind.menu "    (TabNine)"))
                                           (= entry.source.name :cmp_yanky)
                                           (do
                                             (set kind.kind " 󰅌 ")
                                             (set kind.menu "    (Clipboard)"))
                                           (= (. strings 1) :TypeParameter)
                                           (do
                                             (set kind.kind "  ")
                                             (set kind.menu
                                                  "    (TypeParameter)"))
                                           (do
                                             (set kind.kind
                                                  (.. " " (or (. strings 1) "")
                                                      " "))
                                             (set kind.menu
                                                  (.. "    ("
                                                      (or (. strings 2) "") ")"))))
                                       kind))}})
  (cmp.setup.cmdline "/"
                     {:sources (cmp.config.sources [{:name :nvim_lsp_document_symbol}]
                                                   [{:name :buffer}])
                      :mapping (cmp.mapping.preset.cmdline)})
  (cmp.setup.cmdline ":"
                     {:sources (cmp.config.sources [{:name :async_path}]
                                                   [{:name :cmdline}])
                      :mapping (cmp.mapping.preset.cmdline)})
  (cmp.event:on :confirm_done (npairs.on_confirm_done)))
