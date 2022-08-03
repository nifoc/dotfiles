(let [osc52 (require :osc52)
      uname (vim.loop.os_uname)
      clip-name :nifocClipboard]
  (fn copy [lines _]
    (-> lines
        (table.concat "\n")
        (osc52.copy)))

  (fn paste []
    [(vim.fn.split (vim.fn.getreg "") "\n") (vim.fn.getregtype "")])

  (if (= uname.sysname :Darwin)
      (set vim.g.clipboard {:name clip-name
                            :copy {:+ copy :* copy}
                            :paste {:+ :pbpaste :* :pbpaste}
                            :cache_enabled 0})
      ;; Other OS
      (set vim.g.clipboard {:name clip-name
                            :copy {:+ copy :* copy}
                            :paste {:+ paste :* paste}
                            :cache_enabled 0}))
  (vim.opt.clipboard:prepend :unnamedplus))

