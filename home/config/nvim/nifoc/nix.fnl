;; Move certain PATH entries to the end of the variable, because XCode CLI is not installed
;; (and I don't want to see the prompt)
(let [current-path vim.env.PATH
      move-paths [:/usr/local/bin :/usr/bin :/usr/sbin :/bin :/sbin]]
  (var new-path [])
  (var append-path [])
  ;; Loop over PATH and prepare the value tables
  (each [part (string.gmatch current-path "[^:]+")]
    (if (vim.tbl_contains move-paths part) (table.insert append-path part)
        (table.insert new-path part)))
  (each [_ part (ipairs append-path)]
    (table.insert new-path part))
  (set vim.env.PATH (table.concat new-path ":")))

