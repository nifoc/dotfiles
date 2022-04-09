(let [substitute (require :substitute)
      yanky (require :yanky)]
  (substitute.setup {:on_substitute (fn [event]
                                      (yanky.init_ring :p event.register
                                                       event.count
                                                       (event.vmode:match "[vV]")))}))
