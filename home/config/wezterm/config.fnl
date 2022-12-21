(let [wezterm (require :wezterm)
      window-padding 15]
  {:default_prog [_G.shells.fish :--interactive]
   ;; Appearance
   :color_scheme "Dracula (Official)"
   :window_decorations :RESIZE
   :window_padding {:left window-padding
                    :right window-padding
                    :top window-padding
                    :bottom window-padding}
   :enable_tab_bar true
   :use_fancy_tab_bar true
   :hide_tab_bar_if_only_one_tab true
   :tab_bar_at_bottom true
   ;; Fonts
   :font (wezterm.font_with_fallback [{:family "JetBrains Mono"
                                       :weight :Medium}
                                      "Symbols Nerd Font"
                                      "Apple Symbols"
                                      "Apple Color Emoji"
                                      "Noto Sans Symbols"
                                      "Noto Sans Symbols2"
                                      :Unifont])
   :font_size 13
   :line_height 0.9
   :freetype_load_target :Light
   ;:freetype_render_target :HorizontalLcd
   :allow_square_glyphs_to_overflow_width :WhenFollowedBySpace
   ;; Keys
   :keys [{:key :UpArrow
           :mods :SHIFT
           :action (wezterm.action.ScrollToPrompt -1)}
          {:key :DownArrow
           :mods :SHIFT
           :action (wezterm.action.ScrollToPrompt 1)}]
   ;; Mouse
   :mouse_bindings [; Only select text and don't open hyperlinks
                    {:event {:Up {:streak 1 :button :Left}}
                     :mods :NONE
                     :action (wezterm.action {:ExtendSelectionToMouseCursor :Cell})}
                    ; Only select word on double click
                    {:event {:Up {:streak 2 :button :Left}}
                     :mods :NONE
                     :action (wezterm.action.SelectTextAtMouseCursor :Word)}
                    ; Select entire output of command
                    {:event {:Down {:streak 3 :button :Left}}
                     :mods :NONE
                     :action (wezterm.action.SelectTextAtMouseCursor :SemanticZone)}
                    ; CMD-click to open a hyperlink
                    {:event {:Up {:streak 1 :button :Left}}
                     :mods :SUPER
                     :action :OpenLinkAtMouseCursor}]
   ;; Scrollback
   :scrollback_lines 5000
   ;; Launch Menu
   :launch_menu [{:label :Btop++ :args [_G.programs.btop]}]
   ;; Other
   :check_for_updates false})

