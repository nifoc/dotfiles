(let [fidget (require :fidget)]
  (fidget.setup {})
  (set vim.notify fidget.notify))
