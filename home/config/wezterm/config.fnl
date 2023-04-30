(let [wezterm (require :wezterm)
      window-padding 15
      colors {:active-background "#282A36"
              :active-foreground "#ABB2BF"
              :active-indicator "#BD93F9"
              :inactive-background "#191A21"
              :inactive-foreground "#6272A4"
              :hover-background "#BD93F9"
              :hover-foreground "#191A21"
              ; Icons
              :elixir "#A074C4"
              :nix "#7EBAE4"
              :ssh "#F4C82D"}]
  ;; Event: Tab format

  (fn extract-tab-info [title]
    (match title
      (where t (t:find "^nvim%s"))
      {:title (t:gsub "^nvim%s(.*)" "%1") :icon " " :color "#019833"}
      (where t (t:find "^git%s"))
      {:title (t:gsub "^git%s(.*)" "%1") :icon " " :color "#41535B"}
      (where t (t:find "^mix%s"))
      {:title (t:gsub "^mix%s(.*)" "%1") :icon " " :color colors.elixir}
      (where t (t:find "^iex%s")) {: title :icon " " :color colors.elixir}
      (where t (t:find "^upa%s")) {: title :icon " " :color colors.nix}
      (where t (t:find "^upp%s")) {: title :icon " " :color colors.nix}
      (where t (t:find "^nrsw%s")) {: title :icon " " :color colors.nix}
      (where t (t:find "^ngc%s")) {: title :icon " " :color colors.nix}
      (where t (t:find "^ssh%s")) {: title :icon " " :color colors.ssh}
      (where t (t:find "^scp%s")) {: title :icon " " :color colors.ssh}
      (where t (t:find :^ytdl)) {: title :icon " " :color "#FF0000"}
      (where t (t:find :^instagram-)) {: title :icon " " :color "#FB2179"}
      (where t (t:find "^gallery-dl%s"))
      {:title (t:gsub "^gallery-dl%s(.*)" "%1") :icon " " :color "#009900"}
      (where t (t:find :^redis-)) {: title :icon " " :color "#DC372C"}
      _ {: title :icon " " :color "#F8F8F2"}))

  (wezterm.on :format-tab-title
              (fn [tab tabs panes config hover max-width]
                (let [tab-info (extract-tab-info tab.active_pane.title)
                      title (wezterm.truncate_right tab-info.title
                                                    (- max-width 5))]
                  (if tab.is_active
                      [; Left
                       {:Background {:Color colors.active-background}}
                       {:Foreground {:Color colors.active-indicator}}
                       {:Text "┃ "}
                       ; Center
                       {:Foreground {:Color tab-info.color}}
                       {:Text tab-info.icon}
                       {:Foreground {:Color colors.active-foreground}}
                       {:Attribute {:Intensity :Bold}}
                       {:Attribute {:Italic true}}
                       {:Text title}
                       ; Right
                       {:Attribute {:Intensity :Normal}}
                       {:Attribute {:Italic false}}
                       {:Text " "}]
                      [; Left
                       {:Background {:Color colors.inactive-background}}
                       {:Foreground {:Color colors.inactive-foreground}}
                       {:Text "  "}
                       ; Center
                       {:Foreground {:Color tab-info.color}}
                       {:Text tab-info.icon}
                       {:Foreground {:Color colors.inactive-foreground}}
                       {:Text title}
                       ; Right
                       {:Text " "}]))))
  ;; Configuration
  {:default_prog [_G.shells.fish :--interactive]
   ;; Appearance
   :color_scheme "Dracula (Official)"
   :window_decorations :RESIZE
   :window_padding {:left window-padding
                    :right window-padding
                    :top window-padding
                    :bottom window-padding}
   ;; Tabs
   :enable_tab_bar true
   :use_fancy_tab_bar false
   :hide_tab_bar_if_only_one_tab true
   :tab_bar_at_bottom true
   :tab_max_width 32
   :colors {:tab_bar {:background colors.inactive-background
                      :new_tab {:bg_color colors.inactive-background
                                :fg_color colors.inactive-foreground
                                :italic false
                                :intensity :Bold}
                      :new_tab_hover {:bg_color colors.hover-background
                                      :fg_color colors.hover-foreground
                                      :italic false
                                      :intensity :Bold}
                      :inactive_tab_hover {:bg_color colors.inactive-background
                                           :fg_color colors.inactive-foreground
                                           :italic false}}}
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
           :action (wezterm.action.ScrollToPrompt 1)}
          {:key :LeftArrow
           :mods :CMD
           :action (wezterm.action.ActivateTabRelative -1)}
          {:key :RightArrow
           :mods :CMD
           :action (wezterm.action.ActivateTabRelative 1)}]
   :send_composed_key_when_left_alt_is_pressed true
   :send_composed_key_when_right_alt_is_pressed true
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

