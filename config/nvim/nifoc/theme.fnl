(import-macros {: colorscheme : highlight : highlight-link} :../macros/cmd)

(let [mod {}
      o vim.opt
      g vim.g
      dracula (require :dracula)
      dracula-colors (dracula.colors)]
  (fn mod.setup []
    (set g.dracula_show_end_of_buffer false)
    (set g.dracula_italic_comment true)
    (set o.background :dark)
    (colorscheme :dracula)
    ;; vim-matchup
    (highlight :MatchParen {:fg dracula-colors.orange :bold true :italic true})
    (highlight :MatchWord {:italic true})
    (highlight-link :MatchupVirtualText :Comment)
    ;; nvim-ts-rainbow
    (highlight :rainbowcol1 {:fg dracula-colors.bright_red})
    (highlight :rainbowcol2 {:fg dracula-colors.bright_yellow})
    (highlight :rainbowcol3 {:fg dracula-colors.bright_blue})
    (highlight :rainbowcol4 {:fg dracula-colors.bright_green})
    (highlight :rainbowcol5 {:fg dracula-colors.bright_magenta})
    (highlight :rainbowcol6 {:fg dracula-colors.bright_cyan})
    (highlight :rainbowcol7 {:fg dracula-colors.bright_white}))

  mod)

