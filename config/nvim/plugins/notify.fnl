(let [notify (require :notify)]
  (notify.setup {})
  (set vim.notify notify))

