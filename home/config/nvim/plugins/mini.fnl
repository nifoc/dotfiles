(import-macros {: highlight} :../macros/cmd)

(let [ai (require :mini.ai)
      cursorword (require :mini.cursorword)
      icons (require :mini.icons)
      move (require :mini.move)
      operators (require :mini.operators)
      pairs (require :mini.pairs)
      snippets (require :mini.snippets)
      surround (require :mini.surround)
      theme (require :nifoc.theme)]
  ;; ai
  (ai.setup)
  ;; cursorword
  (cursorword.setup)
  (highlight :MiniCursorword {:bg theme.colors.selection})
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
  ;; operators
  (operators.setup)
  ;; pairs
  (pairs.setup)
  ;; snippets
  (snippets.setup)
  ;; surround
  (surround.setup))
