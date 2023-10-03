(let [notify (require :notify)]
  (notify.setup {:stages :fade})
  (set vim.notify notify))
