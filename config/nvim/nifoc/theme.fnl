(let [mod {}
      o vim.opt
      g vim.g
      cmd vim.cmd]
  (fn mod.setup []
    (set g.dracula_show_end_of_buffer false)
    (set g.dracula_italic_comment true)
    (set o.background :dark)
    (cmd "colorscheme dracula"))

  mod)
