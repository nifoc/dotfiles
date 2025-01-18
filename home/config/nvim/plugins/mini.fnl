(let [icons (require :mini.icons)
      move (require :mini.move)
      pairs (require :mini.pairs)
      snippets (require :mini.snippets)
      surround (require :mini.surround)]
  (icons.setup)
  (move.setup {:mappings {:left :<A-Left>
                          :right :<A-Right>
                          :down :<A-Down>
                          :up :<A-Up>
                          :line_left :<A-Left>
                          :line_right :<A-Right>
                          :line_down :<A-Down>
                          :line_up :<A-Up>}})
  (pairs.setup)
  (snippets.setup)
  (surround.setup))
