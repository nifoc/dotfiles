(let [mod {}
      wezterm (require :wezterm)
      openapi-spec-file vim.env.OPENAPI_SPEC_FILE]
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
  (local serie #[(exe :serie)])
  (local openapi-tui #[(exe :openapi-tui) :-i openapi-spec-file])
  (local serpl #[(exe :serpl)])
  (local yazi #[(exe :yazi)])

  (fn mod.open-lazygit []
    (open-split lazygit))

  (fn mod.open-serie []
    (open-split serie))

  (fn mod.open-openapi-tui []
    (if (not= openapi-spec-file nil) (open-split openapi-tui)
        (vim.notify "OpenAPI specification not found" vim.log.levels.ERROR)))

  (fn mod.open-serpl []
    (open-split serpl))

  (fn mod.open-yazi []
    (open-split yazi))

  mod)
