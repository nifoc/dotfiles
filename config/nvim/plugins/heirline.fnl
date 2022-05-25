(let [heirline (require :heirline)
      utils (require :heirline.utils)
      conditions (require :heirline.conditions)
      ns (. (require :nifoc.statusline) :heirline)]
  (local default-statusline [;; Left
                             ns.spacer
                             ns.vi-mode
                             (utils.surround [" " ""] nil ns.git)
                             (utils.surround [" " ""] nil ns.diagnostics)
                             (utils.surround [" " ""] nil ns.current-function)
                             ;; Right
                             {:provider "%="}
                             ns.filetype-block
                             ns.space
                             ns.buffer-options
                             ns.space
                             ns.scrollbar
                             ns.space
                             ns.position
                             ns.spacer])
  (local telescope-statusline
         {:condition (fn []
                       (conditions.buffer_matches {:filetype [:TelescopePrompt]}))
          1 ns.spacer
          2 (ns.custom-mode :Telescope)})
  (local statuslines {:hl ns.default-hl
                      :init utils.pick_child_on_condition
                      1 telescope-statusline
                      2 default-statusline})
  ;; Load Statusline
  (set vim.opt.laststatus 3)
  (heirline.setup statuslines))

