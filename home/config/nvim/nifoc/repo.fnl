(let [mod {}
      wezterm (require :wezterm)]
  (fn exe [bin] (vim.fn.exepath bin))

  (fn open-split [program]
    (let [args [:cli :split-pane :--bottom :--percent :60 "--"]]
      (each [_ value (ipairs program)]
        (table.insert args value))
      (wezterm.exec args
                    (fn [result]
                      (when (not= result.code 0)
                        (vim.notify "wezterm: Error opening split window"
                                    vim.log.levels.ERROR []))))))

  (fn mod.open-repo []
    (case vim.env.REMOTE_REPO_TYPE
      :github nil
      :gitlab (vim.system [:glab :repo :view :--web])
      :forgejo nil))

  (fn mod.open-merge-request []
    (case vim.env.REMOTE_REPO_TYPE
      :github nil
      :gitlab (vim.system [:glab :mr :view :--web])
      :forgejo nil))

  (fn mod.open-ci []
    (case vim.env.REMOTE_REPO_TYPE
      :github nil
      :gitlab (open-split [(exe :glab) :pipeline :ci :view])
      :forgejo nil))

  mod)
