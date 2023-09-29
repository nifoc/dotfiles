(let [ibl (require :ibl)
      ibl-hooks (require :ibl.hooks)]
  (ibl.setup {:indent {:char "┆"}
              :scope {:char "┆"
                      :show_start false
                      :show_end false
                      :highlight [:RainbowDelimiterRed
                                  :RainbowDelimiterYellow
                                  :RainbowDelimiterBlue
                                  :RainbowDelimiterOrange
                                  :RainbowDelimiterGreen
                                  :RainbowDelimiterViolet
                                  :RainbowDelimiterCyan]}
              :exclude {:buftypes [:help :nofile :prompt :quickfix :terminal]}})
  (ibl-hooks.register ibl-hooks.type.SCOPE_HIGHLIGHT
                      ibl-hooks.builtin.scope_highlight_from_extmark))
