(let [notify (require :notify)]
  (notify.setup {:stages :fade})
  (set vim.notify notify)
  ((. (require :lsp-notify) :setup) {}))
