(let [rainbow-delimiters (require :rainbow-delimiters)]
  (set vim.g.rainbow_delimiters
       {:strategy {"" (. rainbow-delimiters :strategy :global)
                   :html (. rainbow-delimiters :strategy :local)
                   :vim (. rainbow-delimiters :strategy :local)}
        :query {"" :rainbow-delimiters :lua :rainbow-blocks}
        :highlight [:RainbowDelimiterRed
                    :RainbowDelimiterYellow
                    :RainbowDelimiterBlue
                    :RainbowDelimiterOrange
                    :RainbowDelimiterGreen
                    :RainbowDelimiterViolet
                    :RainbowDelimiterCyan]}))
