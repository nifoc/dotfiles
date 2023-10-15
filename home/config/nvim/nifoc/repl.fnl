(let [mod {}
      wezterm (require :wezterm)]
  (fn exe [bin] (vim.fn.exepath bin))

  (fn split [program]
    (let [args [:cli :split-pane :--bottom :--percent :30 "--"]]
      (each [_ value (ipairs program)]
        (table.insert args value))
      (wezterm.exec args)))

  (local elixir [(exe :iex)])
  (local erlang [(exe :erl)])
  (local fennel [(exe :fennel) :--repl])
  (local fish [(exe :fish)])
  (local javascript [(exe :node)])
  (local nix [(exe :nix) :repl])
  (local ruby [(exe :irb)])
  ;; Map filetype to REPL
  (local repl-map {: elixir : erlang : fennel : fish : javascript : nix : ruby})

  (fn mod.open-shell []
    (let [shell (. repl-map :fish)]
      (split shell)))

  (fn mod.open-repl []
    (let [ft vim.bo.filetype
          repl (. repl-map ft)]
      (when (not= repl nil)
        (split repl))))

  mod)
