(let [rainbow-delimiters (require :rainbow-delimiters)]
  (set vim.g.rainbow_delimiters
       {:strategy {"" (. rainbow-delimiters :strategy :global)
                   :vim (. rainbow-delimiters :strategy :local)}
        :query {"" :rainbow-delimiters :lua :rainbow-blocks}
        :highlight [:RainbowDelimite
                    :RainbowDelimiterYellow
                    :RainbowDelimiterBlue
                    :RainbowDelimiterOrange
                    :RainbowDelimiterGreen
                    :RainbowDelimiterViolet
                    :RainbowDelimiterCyan]}))
