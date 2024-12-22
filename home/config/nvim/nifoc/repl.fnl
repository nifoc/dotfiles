(let [mod {}
      wezterm (require :wezterm)]
  (fn exe [bin] (vim.fn.exepath bin))

  (fn open-split [program-fn]
    (let [args [:cli :split-pane :--bottom :--percent :30 "--"]
          program (program-fn)]
      (each [_ value (ipairs program)]
        (table.insert args value))
      (wezterm.exec args
                    (fn [result]
                      (when (not= result.code 0)
                        (vim.notify "wezterm: Error opening split window"
                                    vim.log.levels.ERROR []))))))

  (local elixir #[(exe :iex)])
  (local erlang #[(exe :erl)])
  (local fennel #[(exe :fennel) :--repl])
  (local fish #[(exe :fish)])
  (local java #[(exe :jshell)])
  (local javascript #[(exe :node)])
  (local nix #[(exe :nix) :repl])
  (local ruby #[(exe :irb)])
  (local typescript #[(exe :node)])
  (local zsh #[(exe :zsh)])
  ;; Map filetype to REPL
  (local repl-map {: elixir
                   : erlang
                   : fennel
                   : fish
                   : java
                   : javascript
                   : nix
                   : ruby
                   : typescript
                   : zsh})

  (fn mod.open-shell []
    (let [shell (. repl-map :zsh)]
      (open-split shell)))

  (fn mod.open-repl []
    (let [ft vim.bo.filetype
          repl (. repl-map ft)]
      (when (not= repl nil)
        (open-split repl))))

  mod)
