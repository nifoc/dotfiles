(import-macros {: colorscheme
                : highlight
                : highlight-link
                : highlight-get-field} :../macros/cmd)

(let [mod {}
      o vim.opt
      dracula (require :dracula)
      dracula-colors (dracula.colors)]
  (set mod.colors dracula-colors)

  (fn mod.setup []
    (dracula.setup {:show_end_of_buffer false :italic_comment true})
    (set o.background :dark)
    (colorscheme :dracula)
    ;; Tabline
    (highlight :TabLine {:fg mod.colors.comment :bg mod.colors.black})
    (highlight :TabLineSel {:fg mod.colors.white :bg mod.colors.bg})
    (highlight :TabLineFill {:bg mod.colors.black})
    ;; matchit
    (highlight :MatchParen {:fg mod.colors.orange :bold true :italic true})
    (highlight :MatchWord {:italic true})
    (highlight-link :MatchupVirtualText :Comment)
    ;; treesitter-context
    (highlight-link :TreesitterContextSeparator :StatusLineNC)
    ;; vim-illuminate
    (highlight :IlluminatedWordText {:bg mod.colors.selection})
    (highlight :IlluminatedWordRead {:bg mod.colors.selection})
    (highlight :IlluminatedWordWrite {:bg mod.colors.selection :underline true}))

  mod)
