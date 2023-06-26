(import-macros {: colorscheme : highlight : highlight-link} :../macros/cmd)

(let [mod {}
      o vim.opt
      g vim.g
      dracula (require :dracula)
      dracula-colors (dracula.colors)]
  (set mod.colors dracula-colors)

  (fn mod.setup []
    (set g.dracula_show_end_of_buffer false)
    (set g.dracula_italic_comment true)
    (set o.background :dark)
    (colorscheme :dracula)
    ;; LSP
    (highlight-link :LspCodeLens :Comment)
    (highlight-link :LspInlayHint :Comment)
    ;; Tabline
    (highlight :TabLine {:fg mod.colors.comment :bg mod.colors.black})
    (highlight :TabLineSel {:fg mod.colors.white :bg mod.colors.bg})
    (highlight :TabLineFill {:bg mod.colors.black})
    ;; vim-matchup
    (highlight :MatchParen {:fg mod.colors.orange :bold true :italic true})
    (highlight :MatchWord {:italic true})
    (highlight-link :MatchupVirtualText :Comment)
    ;; vim-illuminate
    (highlight :IlluminatedWordText {:bg mod.colors.selection})
    (highlight :IlluminatedWordRead {:bg mod.colors.selection})
    (highlight :IlluminatedWordWrite {:bg mod.colors.selection :underline true})
    ;; nvim-ts-rainbow2
    (highlight :TSRainbowRed {:fg mod.colors.red})
    (highlight :TSRainbowYellow {:fg mod.colors.yellow})
    (highlight :TSRainbowBlue {:fg mod.colors.purple})
    (highlight :TSRainbowOrange {:fg mod.colors.orange})
    (highlight :TSRainbowGreen {:fg mod.colors.green})
    (highlight :TSRainbowViolet {:fg mod.colors.pink})
    (highlight :TSRainbowCyan {:fg mod.colors.cyan}))

  mod)

