;; Move certain PATH entries to the end of the variable, because XCode CLI is not installed
;; (and I don't want to see the prompt)
(let [current-path vim.env.PATH
      move-paths ":/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin"
      new-path (-> current-path (string.gsub move-paths "") (.. move-paths))]
  (set vim.env.PATH new-path))

