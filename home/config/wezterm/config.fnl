(let [wezterm (require :wezterm)]
  {:default_prog _G.default_shell
   ;; Appearance
   :color_scheme "Dracula (Official)"
   :window_padding {:left :6px :right :6px :top :2px :bottom :4px}
   :enable_tab_bar true
   :use_fancy_tab_bar true
   :hide_tab_bar_if_only_one_tab true
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
   ;; Mouse
   :mouse_bindings [; Only select text and don't open hyperlinks
                    {:event {:Up {:streak 1 :button :Left}}
                     :mods :NONE
                     :action (wezterm.action {:ExtendSelectionToMouseCursor :Cell})}
                    ; Don't copy on double click
                    {:event {:Up {:streak 2 :button :Left}}
                     :mods :NONE
                     :action :Nop}
                    ; CMD-click to open a hyperlink
                    {:event {:Up {:streak 1 :button :Left}}
                     :mods :CMD
                     :action :OpenLinkAtMouseCursor}]
   ;; Scrollback
   :scrollback_lines 5000})

