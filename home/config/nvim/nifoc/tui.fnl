(let [mod {}
      wezterm (require :wezterm)]
  (fn exe [bin] (vim.fn.exepath bin))

  (fn open-split [program-fn]
    (let [args [:cli :split-pane :--bottom :--percent :60 "--"]
          program (program-fn)]
      (each [_ value (ipairs program)]
        (table.insert args value))
      (wezterm.set_tab_title "")
      (wezterm.exec args
                    (fn [result]
                      (when (not= result.code 0)
                        (vim.notify "wezterm: Error opening split window"
                                    vim.log.levels.ERROR []))))))

  (local lazygit #[(exe :lazygit)])

  (fn mod.open-lazygit []
    (open-split lazygit))

  mod)
