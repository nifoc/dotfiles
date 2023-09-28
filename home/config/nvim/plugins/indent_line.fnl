(let [indent (require :ibl)]
  (indent.setup {:indent {:char "┆"}
                 :scope {:char "┆"}
                 :exclude {:buftypes [:help
                                      :nofile
                                      :prompt
                                      :quickfix
                                      :terminal]}}))
