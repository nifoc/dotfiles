(let [mod {}
      keymap vim.keymap
      (ok-substitute substitute) (pcall require :substitute)
      (ok-fzf fzf) (pcall require :fzf-lua)
      fzf-layout-bottom {:winopts #(let [height (math.floor (* vim.o.lines 0.4))]
                                     {:split (.. "belowright new | resize "
                                                 (tostring height))})}
      fzf-layout-dropdown {:winopts {:height 0.4
                                     :width 0.6
                                     :preview {:hidden :hidden}}}
      fzf-layout-big-dropdown {:winopts {:height 0.6
                                         :width 0.7
                                         :preview {:layout :vertical}}}
      (ok-npairs npairs) (pcall require :nvim-autopairs)
      (ok-hover hover) (pcall require :hover)
      (ok-gitsigns gitsigns) (pcall require :gitsigns)
      (ok-neogit neogit) (pcall require :neogit)
      (ok-wk wk) (pcall require :which-key)
      repl (require :nifoc.repl)
      repo (require :nifoc.repo)
      formatting (require :nifoc.formatting)]
  (fn mod.setup []
    (keymap.set :n :<space> :<nop> {:noremap true})
    ;; Leader Mappings
    (when ok-fzf
      (keymap.set :n :<leader>o #(fzf.files fzf-layout-bottom)
                  {:desc "Find Files"})
      (keymap.set :n :<leader>s #(fzf.live_grep fzf-layout-bottom)
                  {:desc "Live Grep"}))
    (keymap.set :n :<leader>fn :<cmd>enew<CR> {:desc "New File"})
    (keymap.set :n :<leader>u "<cmd>UrlView buffer<CR>" {:desc "Open UrlView"})
    (keymap.set :n :<leader>c repl.open-shell {:desc "Open Shell"})
    (keymap.set :n :<leader>r repl.open-repl {:desc "Open REPL"})
    (when ok-fzf
      (keymap.set :n :<leader>bl #(fzf.buffers fzf-layout-big-dropdown)
                  {:desc "List Buffers"})
      (keymap.set :n :<leader>bf #(fzf.grep_curbuf fzf-layout-big-dropdown)
                  {:desc "Find In Buffer"})
      (keymap.set :n :<leader>bt #(fzf.treesitter fzf-layout-big-dropdown)
                  {:desc "Find via Treesitter"}))
    (when ok-neogit
      (keymap.set :n :<leader>g #(neogit.open {:kind :split})
                  {:desc "Open Neogit"})
      (keymap.set :n :<leader>vs #(neogit.open {:kind :split})
                  {:desc "VCS Status"}))
    (when ok-fzf
      (keymap.set :n :<leader>vb #(fzf.git_branches fzf-layout-dropdown)
                  {:desc "List VCS Branches"}))
    (when ok-gitsigns
      (keymap.set :n :<leader>vl #(gitsigns.blame_line {:full true})
                  {:desc "Blame Line"}))
    (keymap.set :n :<leader>vd :<cmd>DiffviewOpen<CR> {:desc "Open DiffView"})
    (keymap.set :n :<leader>vvr #(repo.open-repo) {:desc "Open repository"})
    (keymap.set :n :<leader>vvm #(repo.open-merge-request) {:desc "Open MR"})
    (keymap.set :n :<leader>vvc #(repo.open-ci) {:desc "Open CI"})
    (keymap.set :n :<leader>vtc #(repo.run-ci) {:desc "Trigger CI"})
    (when ok-fzf
      (keymap.set :n :<leader>lk fzf.keymaps {:desc "Show Keymappings"})
      (keymap.set :n :<leader>ld #(fzf.diagnostics_document fzf-layout-bottom)
                  {:desc "Show Diagnostics"})
      (keymap.set :n :<leader>lt :<cmd>TodoFzfLua<CR>
                  {:desc "Show Todo Comments"}))
    (keymap.set :n :<leader>dli :<cmd>LspInfo<CR> {:desc "LSP Info"})
    (keymap.set :n :<leader>dlr :<cmd>LspRestart<CR> {:desc "Restart LSP"})
    (keymap.set :n :<leader>ds #(vim.diagnostic.open_float {:scope :line})
                {:desc "Show Line Diagnostics"})
    (keymap.set :n :<leader>dtp :<cmd>TSPlaygroundToggle<CR>
                {:desc "Toggle Treetsitter Playground"})
    ;; Other Mappings
    (when ok-npairs
      (keymap.set :i :<CR> npairs.autopairs_cr
                  {:expr true :replace_keycodes false :silent true}))
    (keymap.set :n :F #(formatting.maybe-format-buffer 0)
                {:desc "Format Buffer"})
    (keymap.set :n :<A-Left> :b)
    (keymap.set :n :<A-Right> :w)
    (keymap.set :n :<S-Left> "^")
    (keymap.set :n :<S-Right> "$")
    (keymap.set :i :<A-Left> :<C-o>b)
    (keymap.set :i :<A-Right> :<C-o>w)
    (keymap.set :i :<S-Left> :<C-o>^)
    (keymap.set :i :<S-Right> :<C-o>$)
    (keymap.set :n :<A-Up> "<cmd>MoveLine -1<CR>" {:noremap true :silent true})
    (keymap.set :n :<A-Down> "<cmd>MoveLine 1<CR>" {:noremap true :silent true})
    (keymap.set :x :<A-Up> "<cmd>MoveBlock -1<CR>" {:noremap true :silent true})
    (keymap.set :x :<A-Down> "<cmd>MoveBlock 1<CR>"
                {:noremap true :silent true})
    (keymap.set :n :p "<Plug>(YankyPutAfter)")
    (keymap.set :n :P "<Plug>(YankyPutBefore)")
    (when ok-substitute
      (keymap.set :x :p substitute.visual))
    (keymap.set :x :P "<Plug>(YankyPutBefore)")
    (keymap.set :n :gp "<Plug>(YankyGPutAfter)")
    (keymap.set :n :gP "<Plug>(YankyGPutBefore)")
    (keymap.set :x :gp "<Plug>(YankyGPutAfter)")
    (keymap.set :x :gP "<Plug>(YankyGPutBefore)")
    (keymap.set :n :y "<Plug>(YankyYank)")
    (keymap.set :x :y "<Plug>(YankyYank)")
    (keymap.set :n "-" :<cmd>Oil<CR> {:desc "Open Oil"})
    ;; hover.nvim
    (when ok-hover
      (keymap.set :n :K hover.hover {:desc "Show Documentation"})
      (keymap.set :n :gK hover.hover_select {:desc "hover.nvim selection"})
      (keymap.set :n :<C-p> #(hover.hover_switch :previous)
                  {:desc "hover.nvim previous source"})
      (keymap.set :n :<C-n> #(hover.hover_switch :next)
                  {:desc "hover.nvim next source"}))
    ;; Label
    (when ok-wk
      (wk.add [{1 :<leader>v :group :vcs}
               {1 :<leader>l :group :list/lsp}
               {1 :<leader>d :group :debug}])))

  (fn mod.lsp-attach [_client bufnr]
    (when ok-fzf
      (keymap.set :n :<leader>t #(fzf.lsp_document_symbols fzf-layout-dropdown)
                  {:buffer bufnr :desc "LSP Document Symbols"})
      (keymap.set :n :<leader>tw
                  #(fzf.lsp_workspace_symbols fzf-layout-big-dropdown)
                  {:buffer bufnr :desc "LSP Workspace Symbols"}))
    (keymap.set :n :<leader>th
                #(vim.lsp.inlay_hint.enable (not (vim.lsp.inlay_hint.is_enabled bufnr))
                                            {: bufnr})
                {:buffer bufnr :desc "Toggle Inlay Hints"})
    (when ok-fzf
      (keymap.set :n :<leader>lca
                  #(fzf.lsp_code_actions fzf-layout-big-dropdown)
                  {:buffer bufnr :desc "LSP Code Action"})
      (keymap.set :n :<leader>lfr #(fzf.lsp_references fzf-layout-big-dropdown)
                  {:buffer bufnr :desc "Find References"})
      (keymap.set :n :<leader>lfd
                  #(fzf.lsp_definitions fzf-layout-big-dropdown)
                  {:buffer bufnr :desc "Find Definitions"})
      (keymap.set :n :<leader>lfi
                  #(fzf.lsp_implementations fzf-layout-big-dropdown)
                  {:buffer bufnr :desc "Find Implementations"})))

  (fn mod.terminal-open [bufnr]
    (let [map-opts {:buffer bufnr}]
      (keymap.set :t :<esc> "<C-\\><C-n>" map-opts)
      (keymap.set :t :<C-h> "<C-\\><C-n><C-W>h" map-opts)
      (keymap.set :t :<C-j> "<C-\\><C-n><C-W>j" map-opts)
      (keymap.set :t :<C-k> "<C-\\><C-n><C-W>k" map-opts)
      (keymap.set :t :<C-l> "<C-\\><C-n><C-W>l" map-opts)))

  mod)
