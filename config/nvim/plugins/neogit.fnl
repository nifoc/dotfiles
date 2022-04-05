(let [neogit (require :neogit)]
  (neogit.setup {:signs {; [ CLOSED, OPENED ]
                         :section ["" ""]
                         :item ["" ""]
                         :hunk ["" ""]}}))
