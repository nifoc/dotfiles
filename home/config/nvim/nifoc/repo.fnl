(let [mod {}
      wezterm (require :wezterm)]
  (fn exe [bin] (vim.fn.exepath bin))

  (fn run-cmd [program]
    (vim.system program {:cwd (vim.loop.cwd)}))

  (fn open-split [program]
    (let [args [:cli
                :split-pane
                :--bottom
                :--percent
                :60
                :--cwd
                (vim.loop.cwd)
                "--"]]
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
      :gitlab (run-cmd [:glab :repo :view :--web])
      :forgejo nil))

  (fn mod.open-merge-request []
    (case vim.env.REMOTE_REPO_TYPE
      :github nil
      :gitlab (run-cmd [:glab :mr :view :--web])
      :forgejo nil))

  (fn mod.open-ci []
    (case vim.env.REMOTE_REPO_TYPE
      :github nil
      :gitlab (open-split [(exe :glab) :pipeline :ci :view])
      :forgejo nil))

  (fn mod.run-ci []
    (case vim.env.REMOTE_REPO_TYPE
      :github nil
      :gitlab (do
                (run-cmd [:glab :pipeline :run])
                (open-split [(exe :glab) :pipeline :ci :view]))
      :forgejo nil))

  mod)
