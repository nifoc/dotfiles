(let [miniclue (require :mini.clue)
      hipatterns (require :mini.hipatterns)]
  ;; https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-ai.md
  ((. (require :mini.ai) :setup) {})
  ;; https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-clue.md
  (miniclue.setup {:triggers [; Leader
                              {:mode :n :keys :<leader>}
                              {:mode :x :keys :<leader>}
                              ; Built-in
                              {:mode :i :keys :<C-x>}]
                   :clues [(miniclue.gen_clues.builtin_completion)]})
  ;; https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-hipatterns.md
  (hipatterns.setup {:highlighters {:fixme {:pattern "%f[%w]()FIXME()%f[%W]"
                                            :group :MiniHipatternsFixme}
                                    :hack {:pattern "%f[%w]()HACK()%f[%W]"
                                           :group :MiniHipatternsHack}
                                    :todo {:pattern "%f[%w]()TODO()%f[%W]"
                                           :group :MiniHipatternsTodo}
                                    :note {:pattern "%f[%w]()NOTE()%f[%W]"
                                           :group :MiniHipatternsNote}
                                    :hex_color (hipatterns.gen_highlighter.hex_color)}})
  ;; https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-jump2d.md
  ((. (require :mini.jump2d) :setup) {:hooks {:before_start (fn []
                                                              (vim.cmd :nohlsearch))}})
  ;; https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-move.md
  ((. (require :mini.move) :setup) {:mappings {:down :<A-Down>
                                               :up :<A-Up>
                                               :line_down :<A-Down>
                                               :line_up :<A-Up>}}))
