(let [neogit (require :neogit)
      gitsigns (require :gitsigns)
      augroup (vim.api.nvim_create_augroup :NifocNeogit {:clear true})
      aucmd vim.api.nvim_create_autocmd]
  (neogit.setup {})
  (aucmd :FileType {:pattern [:NeogitBranchDescription
                              :NeogitCommitMessage
                              :NeogitCommitView
                              :NeogitLogView
                              :NeogitMergeMessage
                              :NeogitPopup
                              :NeogitStatus
                              :NeogitTagMessage]
                    :callback #(set vim.b.toggle_line_style 0)
                    :group augroup})
  (aucmd :User {:pattern [:NeogitCommitComplete
                          :NeogitPullComplete
                          :NeogitPushComplete
                          :NeogitStatusRefreshed]
                :callback #(gitsigns.refresh)
                :group augroup}))
