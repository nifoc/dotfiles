(import-macros {: highlight} :../macros/cmd)

(let [ai (require :mini.ai)
      clue (require :mini.clue)
      cmt (require :mini.comment)
      cursorword (require :mini.cursorword)
      files (require :mini.files)
      icons (require :mini.icons)
      move (require :mini.move)
      notify (require :mini.notify)
      operators (require :mini.operators)
      pairs (require :mini.pairs)
      snippets (require :mini.snippets)
      surround (require :mini.surround)
      theme (require :nifoc.theme)]
  ;; ai
  (ai.setup)
  ;; clue
  (clue.setup {:triggers [;; Leader
                          {:mode :n :keys :<Leader>}
                          {:mode :x :keys :<Leader>}
                          ;; g
                          {:mode :n :keys :g}
                          {:mode :x :keys :g}
                          ;; Registers
                          {:mode :n :keys "\""}
                          {:mode :x :keys "\""}
                          {:mode :i :keys :<C-r>}
                          {:mode :c :keys :<C-r>}
                          ;; Window
                          {:mode :n :keys :<C-w>}
                          ;; z
                          {:mode :n :keys :z}
                          {:mode :x :keys :z}]
               :clues [(clue.gen_clues.g)
                       (clue.gen_clues.registers)
                       (clue.gen_clues.windows)
                       (clue.gen_clues.z)]})
  ;; comment
  (cmt.setup)
  ;; cursorword
  (cursorword.setup)
  (highlight :MiniCursorword {:bg theme.colors.selection})
  ;; files
  (files.setup)
  ;; icons
  (icons.setup)
  ;; move
  (move.setup {:mappings {:left :<A-Left>
                          :right :<A-Right>
                          :down :<A-Down>
                          :up :<A-Up>
                          :line_left :<A-Left>
                          :line_right :<A-Right>
                          :line_down :<A-Down>
                          :line_up :<A-Up>}})
  ;; notify
  (notify.setup {:window {:max_width_share 0.5}})
  ;; operators
  (operators.setup)
  ;; pairs
  (pairs.setup)
  ;; snippets
  (snippets.setup)
  ;; surround
  (surround.setup))
