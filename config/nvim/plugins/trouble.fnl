(let [trouble (require :trouble)]
  (trouble.setup {:action_keys {:previous :<Up> :next :<Down>}
                  :use_diagnostic_signs true}))
