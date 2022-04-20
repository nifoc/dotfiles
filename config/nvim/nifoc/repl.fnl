(let [mod {}
      terminal-class (require :toggleterm.terminal)
      terminal terminal-class.Terminal]
  (local elixir (terminal:new {:cmd :iex :close_on_exit true}))
  (local erlang (terminal:new {:cmd :erl :close_on_exit true}))
  (local fennel (terminal:new {:cmd "fennel --repl" :close_on_exit true}))
  (local fish (terminal:new {:cmd :fish :close_on_exit true}))
  (local javascript (terminal:new {:cmd :node :close_on_exit true}))
  (local nix (terminal:new {:cmd "nix repl" :close_on_exit true}))
  (local ruby (terminal:new {:cmd :irb :close_on_exit true}))
  ;; Map filetype to REPL
  (local repl-map {: elixir : erlang : fennel : fish : javascript : nix : ruby})

  (fn mod.toggle-shell []
    (let [shell (. repl-map :fish)]
      (shell:toggle)))

  (fn mod.toggle-repl []
    (let [ft vim.bo.filetype
          repl (. repl-map ft)]
      (when (not= repl nil)
        (repl:toggle))))

  mod)

