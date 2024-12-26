(let [mod {}
      keymap vim.keymap
      substitute (require :substitute)
      fzf (require :fzf-lua)
      fzf-layout-bottom {:winopts_fn #(let [height (math.floor (* vim.o.lines
                                                                  0.4))]
                                        {:split (.. "belowright new | resize "
                                                    (tostring height))})}
      fzf-layout-dropdown {:winopts {:height 0.4
                                     :width 0.6
                                     :preview {:hidden :hidden}}}
      npairs (require :nvim-autopairs)
      hover (require :hover)
      gitsigns (require :gitsigns)
      neogit (require :neogit)
      wk (require :which-key)
      repl (require :nifoc.repl)
      repo (require :nifoc.repo)
      formatting (require :nifoc.formatting)]
  (fn mod.setup []
    (keymap.set :n :<space> :<nop> {:noremap true})
    ;; Leader Mappings
    (keymap.set :n :<leader>o fzf.files {:desc "Find Files"})
    (keymap.set :n :<leader>s #(fzf.live_grep fzf-layout-bottom)
                {:desc "Live Grep"})
    (keymap.set :n :<leader>fn :<cmd>enew<CR> {:desc "New File"})
    (keymap.set :n :<leader>u "<cmd>UrlView buffer<CR>" {:desc "Open UrlView"})
    (keymap.set :n :<leader>c repl.open-shell {:desc "Open Shell"})
    (keymap.set :n :<leader>r repl.open-repl {:desc "Open REPL"})
    (keymap.set :n :<leader>bl fzf.buffers {:desc "List Buffers"})
    (keymap.set :n :<leader>bf fzf.grep_curbuf {:desc "Find In Buffer"})
    (keymap.set :n :<leader>bt fzf.treesitter {:desc "Find via Treesitter"})
    (keymap.set :n :<leader>g #(neogit.open {:kind :split})
                {:desc "Open Neogit"})
    (keymap.set :n :<leader>vs #(neogit.open {:kind :split})
                {:desc "VCS Status"})
    (keymap.set :n :<leader>vb #(fzf.git_branches fzf-layout-dropdown)
                {:desc "List VCS Branches"})
    (keymap.set :n :<leader>vl #(gitsigns.blame_line {:full true})
                {:desc "Blame Line"})
    (keymap.set :n :<leader>vd :<cmd>DiffviewOpen<CR> {:desc "Open DiffView"})
    (keymap.set :n :<leader>vvr #(repo.open-repo) {:desc "Open repository"})
    (keymap.set :n :<leader>vvm #(repo.open-merge-request) {:desc "Open MR"})
    (keymap.set :n :<leader>vvc #(repo.open-ci) {:desc "Open CI"})
    (keymap.set :n :<leader>vtc #(repo.run-ci) {:desc "Trigger CI"})
    (keymap.set :n :<leader>lk fzf.keymaps {:desc "Show Keymappings"})
    (keymap.set :n :<leader>ld #(fzf.diagnostics_document fzf-layout-bottom)
                {:desc "Show Diagnostics"})
    (keymap.set :n :<leader>lt :<cmd>TodoFzfLua<CR>
                {:desc "Show Todo Comments"})
    (keymap.set :n :<leader>dli :<cmd>LspInfo<CR> {:desc "LSP Info"})
    (keymap.set :n :<leader>dlr :<cmd>LspRestart<CR> {:desc "Restart LSP"})
    (keymap.set :n :<leader>ds #(vim.diagnostic.open_float {:scope :line})
                {:desc "Show Line Diagnostics"})
    (keymap.set :n :<leader>dtp :<cmd>TSPlaygroundToggle<CR>
                {:desc "Toggle Treetsitter Playground"})
    ;; Other Mappings
    (keymap.set :i :<CR> npairs.autopairs_cr
                {:expr true :replace_keycodes false :silent true})
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
    (keymap.set :x :p substitute.visual)
    (keymap.set :x :P "<Plug>(YankyPutBefore)")
    (keymap.set :n :gp "<Plug>(YankyGPutAfter)")
    (keymap.set :n :gP "<Plug>(YankyGPutBefore)")
    (keymap.set :x :gp "<Plug>(YankyGPutAfter)")
    (keymap.set :x :gP "<Plug>(YankyGPutBefore)")
    (keymap.set :n :y "<Plug>(YankyYank)")
    (keymap.set :x :y "<Plug>(YankyYank)")
    (keymap.set :n "-" :<cmd>Oil<CR> {:desc "Open Oil"})
    ;; hover.nvim
    (keymap.set :n :K hover.hover {:desc "Show Documentation"})
    (keymap.set :n :gK hover.hover_select {:desc "hover.nvim selection"})
    (keymap.set :n :<C-p> #(hover.hover_switch :previous)
                {:desc "hover.nvim previous source"})
    (keymap.set :n :<C-n> #(hover.hover_switch :next)
                {:desc "hover.nvim next source"})
    (keymap.set :n :<MouseMove> hover.hover_mouse {:desc "hover.nvim mouse"})
    ;; Label
    (wk.add [{1 :<leader>v :group :vcs}
             {1 :<leader>l :group :list/lsp}
             {1 :<leader>d :group :debug}]))

  (fn mod.lsp-attach [_client bufnr]
    (keymap.set :n :<leader>t #(fzf.lsp_document_symbols fzf-layout-dropdown)
                {:buffer bufnr :desc "LSP Document Symbols"})
    (keymap.set :n :<leader>tw #(fzf.lsp_workspace_symbols fzf-layout-dropdown)
                {:buffer bufnr :desc "LSP Workspace Symbols"})
    (keymap.set :n :<leader>th
                #(vim.lsp.inlay_hint.enable (not (vim.lsp.inlay_hint.is_enabled bufnr))
                                            {: bufnr})
                {:buffer bufnr :desc "Toggle Inlay Hints"})
    (keymap.set :n :<leader>lca fzf.lsp_code_actions
                {:buffer bufnr :desc "LSP Code Action"})
    (keymap.set :n :<leader>lfr fzf.lsp_references
                {:buffer bufnr :desc "Find References"})
    (keymap.set :n :<leader>lfd fzf.lsp_definitions
                {:buffer bufnr :desc "Find Definitions"})
    (keymap.set :n :<leader>lfi fzf.lsp_implementations
                {:buffer bufnr :desc "Find Implementations"}))

  (fn mod.terminal-open [bufnr]
    (let [map-opts {:buffer bufnr}]
      (keymap.set :t :<esc> "<C-\\><C-n>" map-opts)
      (keymap.set :t :<C-h> "<C-\\><C-n><C-W>h" map-opts)
      (keymap.set :t :<C-j> "<C-\\><C-n><C-W>j" map-opts)
      (keymap.set :t :<C-k> "<C-\\><C-n><C-W>k" map-opts)
      (keymap.set :t :<C-l> "<C-\\><C-n><C-W>l" map-opts)))

  mod)
