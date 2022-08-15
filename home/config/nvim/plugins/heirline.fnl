(let [heirline (require :heirline)
      utils (require :heirline.utils)
      conditions (require :heirline.conditions)
      ns (require :nifoc.statusline)]
  (local default-statusline [;; Left
                             ns.vi-mode
                             (ns.insert-left-unless-empty ns.git " ")
                             (ns.insert-left-unless-empty ns.diagnostics " ")
                             (ns.insert-left-unless-empty ns.current-function
                                                          " ")
                             ;; Right
                             ns.push-right
                             ns.filetype-block
                             ns.space
                             ns.buffer-options
                             ns.space
                             ns.scrollbar
                             ns.space
                             ns.position
                             ns.search-count])
  (local telescope-statusline
         {:condition (fn []
                       (conditions.buffer_matches {:filetype [:TelescopePrompt]}))
          1 (ns.custom-mode :Telescope :black :green)})
  (local neogit-statusline
         {:condition (fn []
                       (conditions.buffer_matches {:filetype [:NeogitStatus]}))
          1 (ns.custom-mode :Neogit :black :purple)})
  (local shell-statusline
         {:condition (fn []
                       (not= vim.b.nifoc_shell_mode nil))
          1 ns.vi-mode
          2 ns.push-right
          3 ns.scrollbar
          4 ns.space
          5 (ns.shell-mode :black :purple)})
  (local statuslines {:hl ns.default-hl
                      :init utils.pick_child_on_condition
                      1 telescope-statusline
                      2 neogit-statusline
                      3 shell-statusline
                      4 default-statusline})
  ;; Load Statusline
  (set vim.opt.laststatus 3)
  (heirline.setup statuslines))

