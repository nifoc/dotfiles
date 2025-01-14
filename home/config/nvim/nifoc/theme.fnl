(import-macros {: colorscheme
                : highlight
                : highlight-link
                : highlight-get-field} :../macros/cmd)

(let [mod {}
      o vim.opt
      g vim.g
      dracula (require :dracula)
      dracula-colors (dracula.colors)]
  (set mod.colors dracula-colors)

  (fn mod.setup []
    (dracula.setup {:show_end_of_buffer false :italic_comment true})
    (set o.background :dark)
    (colorscheme :dracula)
    ;; Tabline
    (highlight :TabLine {:fg mod.colors.comment :bg mod.colors.black})
    (highlight :TabLineSel {:fg mod.colors.white :bg mod.colors.bg})
    (highlight :TabLineFill {:bg mod.colors.black})
    ;; matchit
    (highlight :MatchParen {:fg mod.colors.orange :bold true :italic true})
    (highlight :MatchWord {:italic true})
    (highlight-link :MatchupVirtualText :Comment)
    ;; vim-illuminate
    (highlight :IlluminatedWordText {:bg mod.colors.selection})
    (highlight :IlluminatedWordRead {:bg mod.colors.selection})
    (highlight :IlluminatedWordWrite {:bg mod.colors.selection :underline true})
    ;; neogit
    (highlight :NeogitBranch {:fg mod.colors.green :bold true})
    (highlight :NeogitBranchHead
               {:fg mod.colors.green :bold true :underline true})
    (highlight :NeogitRemote {:fg mod.colors.yellow :bold true})
    (highlight :NeogitSectionHeader {:fg mod.colors.purple :bold true})
    (let [neogit-groups-added [:NeogitChangeAdded :NeogitChangeNewFile]
          neogit-groups-updated [:NeogitChangeModified
                                 :NeogitChangeRenamed
                                 :NeogitChangeUpdated
                                 :NeogitChangeCopied
                                 :NeogitChangeBothModified]
          neogit-groups-deleted [:NeogitChangeDeleted]]
      (each [_ group (pairs neogit-groups-added)]
        (highlight group {:fg mod.colors.green :italic true}))
      (each [_ group (pairs neogit-groups-updated)]
        (highlight group {:fg mod.colors.yellow :italic true}))
      (each [_ group (pairs neogit-groups-deleted)]
        (highlight group {:fg mod.colors.red :italic true})))
    (highlight :NeogitDiffAdd {:fg mod.colors.comment :bg mod.colors.green})
    (highlight :NeogitDiffAddHighlight
               {:fg mod.colors.black :bg mod.colors.bright_green})
    (highlight :NeogitDiffDelete {:fg mod.colors.comment :bg mod.colors.red})
    (highlight :NeogitDiffDeleteHighlight
               {:fg mod.colors.black :bg mod.colors.bright_red})
    (highlight :NeogitCursorLine {:fg mod.colors.fg :bg mod.colors.visual}))

  mod)
