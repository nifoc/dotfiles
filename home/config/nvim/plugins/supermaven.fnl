(let [supermaven (require :supermaven-nvim)]
  (supermaven.setup {:disable_inline_completion true
                     :disable_keymaps true
                     :log_level :off
                     :ignore_filetypes {:age true}}))
