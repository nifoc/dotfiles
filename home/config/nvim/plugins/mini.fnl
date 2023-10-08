(let [miniclue (require :mini.clue)]
  ;; https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-clue.md
  (miniclue.setup {:triggers [; Leader
                              {:mode :n :keys :<leader>}
                              {:mode :x :keys :<leader>}
                              ; Built-in
                              {:mode :i :keys :<C-x>}]
                   :clues [(miniclue.gen_clues.builtin_completion)]})
  ;; https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-comment.md
  ((. (require :mini.comment) :setup) {})
  ;; https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-jump2d.md
  ((. (require :mini.jump2d) :setup) {:hooks {:before_start (fn []
                                                              (vim.cmd :nohlsearch))}})
  ;; https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-surround.md
  ((. (require :mini.surround) :setup) {})
  ;; https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-pairs.md
  ((. (require :mini.pairs) :setup) {}))
