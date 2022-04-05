(let [g vim.g
      cmd vim.cmd]
  (set g.yoinkIncludeDeleteOperations 1)
  (cmd "packadd! vim-cutlass")
  (cmd "packadd! vim-yoink")
  (cmd "packadd! vim-subversive"))
