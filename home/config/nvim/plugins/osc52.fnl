(let [osc52 (require :osc52)]
  (fn copy [lines _]
    (-> lines
        (table.concat "\n")
        (osc52.copy)))

  (fn paste []
    [(vim.fn.split (vim.fn.getreg "") "\n") (vim.fn.getregtype "")])

  (set vim.g.clipboard {:name :osc52
                        :copy {:+ copy :* copy}
                        :paste {:+ paste :* paste}})
  (vim.opt.clipboard:prepend :unnamedplus))

