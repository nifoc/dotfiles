(let [matchup (require :match-up)]
  (matchup.setup {:matchparen {:deferred true
                               :offscreen {:method :popup}
                               :start_sign ""
                               :end_sign ""}}))

