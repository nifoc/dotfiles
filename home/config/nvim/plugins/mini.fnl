(let [miniclue (require :mini.clue)
      hipatterns (require :mini.hipatterns)
      b vim.b
      api vim.api
      ctrl_n (api.nvim_replace_termcodes :<C-g><C-g><C-n> true false true)
      augroup (vim.api.nvim_create_augroup :NifocMini {:clear true})
      aucmd vim.api.nvim_create_autocmd]
  ;; https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-ai.md
  ((. (require :mini.ai) :setup) {})
  ;; https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-clue.md
  (miniclue.setup {:triggers [; Leader
                              {:mode :n :keys :<leader>}
                              {:mode :x :keys :<leader>}
                              ; Built-in
                              {:mode :i :keys :<C-x>}]
                   :clues [(miniclue.gen_clues.builtin_completion)]})
  ;; https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-comment.md
  ((. (require :mini.comment) :setup) {})
  ;; https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-completion.md
  (set b.nifoc_completion_fallback_count 0)

  (fn completion-fallback []
    (let [count b.nifoc_completion_fallback_count]
      (when (< count 3)
        (api.nvim_feedkeys ctrl_n :n false)
        (set b.nifoc_completion_fallback_count (+ count 1)))))

  ((. (require :mini.completion) :setup) {:window {:info {:height 25
                                                          :width 80
                                                          :border :rounded}
                                                   :signature {:height 25
                                                               :width 80
                                                               :border :rounded}}
                                          :lsp_completion {:source_func :omnifunc
                                                           :auto_setup false}
                                          :fallback_action completion-fallback})
  (aucmd [:InsertLeave :CursorHoldI]
         {:callback #(set b.nifoc_completion_fallback_count 0)
          :group augroup
          :desc "Re-enable completion fallback on cursor-hold"})
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
                                               :line_up :<A-Up>}})
  ;; https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-surround.md
  ((. (require :mini.surround) :setup) {})
  ;; https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-pairs.md
  ((. (require :mini.pairs) :setup) {}))
