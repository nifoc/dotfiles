(let [wezterm (require :wezterm)
      window-padding 15
      colors {:frame-background "#282A36"
              :active-background "#282A36"
              :active-foreground "#ABB2BF"
              :active-indicator "#BD93F9"
              :inactive-background "#282A36"
              :inactive-foreground "#6272A4"
              :hover-background "#242530"
              :hover-foreground "#191A21"
              ; Icons
              :elixir "#A074C4"
              :nix "#7EBAE4"
              :reddit "#FA4400"
              :ssh "#F4C82D"}
      enable-ligatures-flags [:calt=1 :clig=1 :liga=1]
      disable-ligatures-flags [:calt=0 :clig=0 :liga=0]]
  (var ligature-panes [])
  (var latest-pane-update nil)
  ;; Event: Tab format

  (fn extract-tab-title [tab]
    (let [title tab.tab_title]
      (if (and title (> (length title) 0)) title tab.active_pane.title)))

  (fn extract-tab-info [title]
    (match title
      (where t (t:find "^nvim%s"))
      {:title (t:gsub "^nvim%s(.*)" "%1") :icon " " :color "#019833"}
      (where t (t:find "^git%s"))
      {:title (t:gsub "^git%s(.*)" "%1") :icon "󰊢 " :color "#F25029"}
      (where t (t:find "^mix%s"))
      {:title (t:gsub "^mix%s(.*)" "%1") :icon " " :color colors.elixir}
      (where t (t:find "^iex%s")) {: title :icon " " :color colors.elixir}
      (where t (t:find "^upa%s")) {: title :icon " " :color colors.nix}
      (where t (t:find "^upp%s")) {: title :icon " " :color colors.nix}
      (where t (t:find "^nrsw%s")) {: title :icon " " :color colors.nix}
      (where t (t:find "^ngc%s")) {: title :icon " " :color colors.nix}
      (where t (t:find "^nix%s")) {: title :icon " " :color colors.nix}
      (where t (t:find "^nix-%w+%s")) {: title :icon " " :color colors.nix}
      (where t (t:find "^deploy%s")) {: title :icon " " :color colors.nix}
      (where t (t:find "^ssh%s")) {: title :icon " " :color colors.ssh}
      (where t (t:find "^scp%s")) {: title :icon " " :color colors.ssh}
      (where t (t:find :^ytdl)) {: title :icon " " :color "#FF0000"}
      (where t (t:find :^instagram-)) {: title :icon " " :color "#FB2179"}
      (where t (t:find "^gallery-dl%s"))
      {:title (t:gsub "^gallery-dl%s(.*)" "%1") :icon " " :color "#009900"}
      (where t (t:find "^bdfr%s"))
      {:title (t:gsub "^bdfr%s(.*)" "%1") :icon " " :color colors.reddit}
      (where t (t:find "^bdfr-%w+%s")) {: title
                                        :icon " "
                                        :color colors.reddit}
      (where t (t:find "^rexit%s")) {: title :icon " " :color colors.reddit}
      (where t (t:find :^redis-)) {: title :icon " " :color "#DC372C"}
      (where t (t:find "^%[%w+%]%s")) {: title :icon " " :color colors.ssh}
      (where t (t:find "^%w+-dev")) {: title :icon " " :color "#0099CC"}
      (where t (t:find "^%w+-dl%s")) {: title :icon " " :color "#22BC00"}
      _ {: title :icon " " :color "#F8F8F2"}))

  (wezterm.on :format-tab-title
              (fn [tab tabs panes config hover max-width]
                (let [raw-title (extract-tab-title tab)
                      tab-info (extract-tab-info raw-title)
                      title (wezterm.truncate_right tab-info.title
                                                    (- max-width 5))]
                  (if tab.is_active
                      [; Left
                       {:Background {:Color colors.active-background}}
                       {:Foreground {:Color colors.active-indicator}}
                       {:Text "│ "}
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
                       {:Attribute {:Italic false}}
                       {:Text title}
                       ; Right
                       {:Text " "}]))))
  (wezterm.on :update-status
              (fn [window pane]
                (local pane-id (pane:pane_id))
                (when (not= latest-pane-update pane-id)
                  (let [overrides (or (window:get_config_overrides) {})]
                    (set latest-pane-update pane-id)
                    (if (. ligature-panes pane-id)
                        (do
                          (set overrides.harfbuzz_features
                               enable-ligatures-flags)
                          (window:set_config_overrides overrides))
                        (do
                          (set overrides.harfbuzz_features
                               disable-ligatures-flags)
                          (window:set_config_overrides overrides)))))))
  (wezterm.on :user-var-changed
              (fn [window pane name value]
                (let [overrides (or (window:get_config_overrides) {})
                      pane-id (pane:pane_id)]
                  (case [name value]
                    [:enable-ligatures :t] (do
                                             (set overrides.harfbuzz_features
                                                  enable-ligatures-flags)
                                             (tset ligature-panes pane-id true)
                                             (window:set_config_overrides overrides))
                    [:enable-ligatures :f] (do
                                             (set overrides.harfbuzz_features
                                                  disable-ligatures-flags)
                                             (tset ligature-panes pane-id nil)
                                             (window:set_config_overrides overrides))))))
  ;; Configuration
  {:default_prog [_G.shells.fish :--interactive]
   ;; Appearance
   :color_scheme "Dracula (Official)"
   :window_decorations :INTEGRATED_BUTTONS|RESIZE
   :window_padding {:left window-padding
                    :right window-padding
                    :top (math.floor (/ window-padding 2))
                    :bottom (math.floor (/ window-padding 2))}
   ;; Tabs
   :enable_tab_bar true
   :use_fancy_tab_bar true
   :hide_tab_bar_if_only_one_tab false
   :tab_bar_at_bottom false
   :tab_max_width 42
   :window_frame {:active_titlebar_bg colors.frame-background
                  :inactive_titlebar_bg colors.frame-background
                  :font (wezterm.font {:family "Berkeley Mono"
                                       :weight :Regular
                                       :harfbuzz_features disable-ligatures-flags})
                  :font_size 11}
   :colors {:tab_bar {:background colors.frame-background
                      :inactive_tab_edge colors.frame-background
                      :new_tab {:bg_color colors.inactive-background
                                :fg_color colors.inactive-foreground}
                      :new_tab_hover {:bg_color colors.hover-background
                                      :fg_color colors.hover-foreground}}}
   ;; Fonts
   :font (wezterm.font_with_fallback [{:family "Berkeley Mono"
                                       :weight :Regular}
                                      "Symbols Nerd Font"
                                      "Apple Symbols"
                                      "Apple Color Emoji"
                                      "Noto Sans Symbols"
                                      "Noto Sans Symbols 2"])
   :font_size 13
   :line_height 0.95
   :freetype_load_target :Light
   ;:freetype_render_target :HorizontalLcd
   :harfbuzz_features disable-ligatures-flags
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
   :launch_menu [{:label :Btop++ :args [_G.programs.btop]}
                 {:label :bash :args [_G.shells.bash]}
                 {:label :fish :args [_G.shells.fish]}
                 {:label :nushell :args [_G.shells.nushell]}]
   ;; Other
   :front_end :WebGpu
   :check_for_updates false})
