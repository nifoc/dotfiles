(let [cmp (require :blink.cmp)
      (ok-luasnip luasnip) (pcall require :luasnip)
      config-snippets (if ok-luasnip
                          {:expand (fn [snippet]
                                     (luasnip.lsp_expand snippet))
                           :active (fn [filter]
                                     (if (and filter filter.direction)
                                         (luasnip.jumpable filter.direction)
                                         (luasnip.in_snippet)))
                           :jump (fn [direction] (luasnip.jump direction))}
                          {})
      config-sources-providers (if (pcall require :cmp_tabnine.config)
                                   {:cmp_tabnine {:name :cmp_tabnine
                                                  :module :blink.compat.source}}
                                   {})]
  (cmp.setup {:keymap {:preset :none
                       :<CR> [:accept :fallback]
                       :<esc> [:cancel :fallback]
                       :<Tab> [(fn [cmp]
                                 (if (cmp.snippet_active) (cmp.accept)
                                     (cmp.select_next)))
                               :snippet_forward
                               :fallback]
                       :<S-Tab> [:select_prev :snippet_backward :fallback]
                       :<Up> [:select_prev :fallback]
                       :<Down> [:select_next :fallback]
                       :<C-space> [:show
                                   :show_documentation
                                   :hide_documentation]
                       :<C-b> [:scroll_documentation_up :fallback]
                       :<C-f> [:scroll_documentation_down :fallback]
                       :<C-e> [:hide :fallback]}
              :completion {:list {:selection (fn [ctx]
                                               (if (= ctx.mode :cmdline)
                                                   :manual
                                                   :preselect))}
                           :menu {:min_width 20
                                  :max_height 25
                                  :draw {:treesitter [:lsp]}}
                           :documentation {:auto_show true
                                           :window {:border :rounded}}
                           :ghost_text {:enabled false}}
              :signature {:enabled true}
              :snippets config-snippets
              :sources {:default [:lsp :luasnip :buffer :path :cmp_tabnine]
                        :providers config-sources-providers}
              :fuzzy {:prebuilt_binaries {:download false :force_version nil}}}))
