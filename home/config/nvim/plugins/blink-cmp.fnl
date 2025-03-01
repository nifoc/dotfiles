(let [cmp (require :blink.cmp)
      (ok-mini-icons mini-icons) (pcall require :mini.icons)
      components (if ok-mini-icons
                     {:kind_icon {:ellipsis false
                                  :text (fn [ctx]
                                          (let [(icon _ _) (mini-icons.get :lsp
                                                                           ctx.kind)]
                                            (if (= ctx.source_name :supermaven)
                                                ""
                                                icon)))
                                  :highlight (fn [ctx]
                                               (let [(_ hl _) (mini-icons.get :lsp
                                                                              ctx.kind)]
                                                 (if (= ctx.source_name
                                                        :supermaven)
                                                     :MiniIconsAzure
                                                     hl)))}
                      :source_name {:text (fn [ctx]
                                            (.. "[" ctx.source_name "]"))}}
                     {:source_name {:text (fn [ctx]
                                            (.. "[" ctx.source_name "]"))}})
      snippets (if (pcall require :mini.snippets)
                   {:preset :mini_snippets}
                   {})
      (sources-default sources-providers) (if (pcall require :supermaven-nvim)
                                              (values [:lsp
                                                       :snippets
                                                       :supermaven
                                                       :buffer
                                                       :path]
                                                      {:supermaven {:name :supermaven
                                                                    :module :blink.compat.source
                                                                    :score_offset 3}})
                                              (values [:lsp
                                                       :snippets
                                                       :buffer
                                                       :path]
                                                      {}))]
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
              :completion {:list {:selection {:preselect (fn [ctx]
                                                           (not= ctx.mode
                                                                 :cmdline))
                                              :auto_insert false}}
                           :menu {:min_width 20
                                  :max_height 25
                                  :border :rounded
                                  :draw {: components
                                         :columns [[:kind_icon]
                                                   {1 :label
                                                    2 :label_description
                                                    :gap 1}
                                                   [:source_name]]
                                         :treesitter [:lsp]}}
                           :documentation {:auto_show true
                                           :auto_show_delay_ms 200
                                           :window {:border :rounded}}
                           :ghost_text {:enabled false}}
              :cmdline {:completion {:menu {:draw {:columns [[:kind_icon]
                                                             [:label]]}}}}
              :signature {:enabled true :window {:border :rounded}}
              : snippets
              :sources {:default sources-default :providers sources-providers}
              :fuzzy {:implementation :prefer_rust
                      :prebuilt_binaries {:download false}}}))
