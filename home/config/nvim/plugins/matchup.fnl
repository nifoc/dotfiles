(let [matchup (require :match-up)]
  (matchup.setup {:matchparen {:deferred true
                               :offscreen {:method :popup :fullwidth true}
                               :start_sign ""
                               :end_sign ""}}))

