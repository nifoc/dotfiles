(let [mod {}
      osc52 (require :vim.ui.clipboard.osc52)
      uname (vim.loop.os_uname)
      clip-name :nifocClipboard]
  (fn mod.setup []
    (if (= uname.sysname :Darwin)
        (set vim.g.clipboard {:name clip-name
                              :copy {:+ :pbcopy :* :pbcopy}
                              :paste {:+ :pbpaste :* :pbpaste}
                              :cache_enabled 0})
        ;; Other OS
        (set vim.g.clipboard
             {:name clip-name
              :copy {:+ osc52.copy :* osc52.copy}
              :paste {:+ osc52.paste :* osc52.paste}}))
    (vim.opt.clipboard:prepend :unnamedplus))

  mod)
