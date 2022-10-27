(let [heirline (require :heirline)
      utils (require :heirline.utils)
      conditions (require :heirline.conditions)
      ns (require :nifoc.statusline)
      nt (require :nifoc.tabline)]
  (local default-statusline [;; Left
                             ns.vi-mode
                             ns.git
                             ns.diagnostics
                             ns.navic
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
  (local shell-statusline
         {:condition (fn []
                       (not= vim.b.nifoc_shell_mode nil))
          1 ns.vi-mode
          2 ns.push-right
          3 ns.scrollbar
          4 ns.space
          5 (ns.shell-mode :black :purple)})
  (local statuslines {:hl ns.default-hl
                      :fallthrough false
                      1 telescope-statusline
                      2 shell-statusline
                      3 default-statusline})
  (local winbar nil)
  (local tabline [nt.os-indicator
                  (utils.make_buflist nt.buffer-block nt.truncate-left
                                      nt.truncate-right)
                  nt.tabpages-block])
  ;; Load Lines
  (set vim.opt.laststatus 3)
  (heirline.setup statuslines winbar tabline))

