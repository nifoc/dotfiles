(let [ai (require :mini.ai)
      icons (require :mini.icons)
      move (require :mini.move)
      operators (require :mini.operators)
      pairs (require :mini.pairs)
      snippets (require :mini.snippets)
      surround (require :mini.surround)]
  (ai.setup)
  (icons.setup)
  (move.setup {:mappings {:left :<A-Left>
                          :right :<A-Right>
                          :down :<A-Down>
                          :up :<A-Up>
                          :line_left :<A-Left>
                          :line_right :<A-Right>
                          :line_down :<A-Down>
                          :line_up :<A-Up>}})
  (operators.setup)
  (pairs.setup)
  (snippets.setup)
  (surround.setup))
