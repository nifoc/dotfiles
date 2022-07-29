(let [mod {}
      terminal-class (require :toggleterm.terminal)
      terminal terminal-class.Terminal]
  (fn repl-setup []
    (set vim.b.nifoc_shell_mode :REPL))

  (fn shell-setup []
    (set vim.b.nifoc_shell_mode :SHELL))

  (local elixir (terminal:new {:cmd :iex
                               :on_open repl-setup
                               :close_on_exit true}))
  (local erlang (terminal:new {:cmd :erl
                               :on_open repl-setup
                               :close_on_exit true}))
  (local fennel (terminal:new {:cmd "fennel --repl"
                               :on_open repl-setup
                               :close_on_exit true}))
  (local fish (terminal:new {:cmd :fish
                             :on_open shell-setup
                             :close_on_exit true}))
  (local javascript (terminal:new {:cmd :node
                                   :on_open repl-setup
                                   :close_on_exit true}))
  (local nix (terminal:new {:cmd "nix repl"
                            :on_open repl-setup
                            :close_on_exit true}))
  (local ruby
         (terminal:new {:cmd :irb :on_open repl-setup :close_on_exit true}))
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

