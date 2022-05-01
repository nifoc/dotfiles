(let [mod {}
      o vim.opt
      g vim.g
      cmd vim.cmd
      dracula (require :dracula)
      dracula-colors (dracula.colors)
      highlight (partial vim.api.nvim_set_hl 0)]
  (fn mod.setup []
    (set g.dracula_show_end_of_buffer false)
    (set g.dracula_italic_comment true)
    (set o.background :dark)
    (cmd "colorscheme dracula")
    (highlight :MatchParen {:fg dracula-colors.orange :bold true :italic true})
    (highlight :MatchWord {:italic true})
    (cmd "highlight link MatchupVirtualText Comment"))

  mod)

