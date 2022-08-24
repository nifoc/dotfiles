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
    ;; vim-illuminate
    (highlight :IlluminatedWordText {:bg dracula-colors.selection})
    (highlight :IlluminatedWordRead {:bg dracula-colors.selection})
    (highlight :IlluminatedWordWrite
               {:bg dracula-colors.selection :underline true}))

  mod)

