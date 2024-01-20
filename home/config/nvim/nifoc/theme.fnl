(import-macros {: colorscheme
                : highlight
                : highlight-link
                : highlight-get-field} :../macros/cmd)

(let [mod {}
      o vim.opt
      g vim.g
      dracula (require :dracula)
      dracula-colors (dracula.colors)]
  (fn swap-bg-with-fg [fg group]
    (highlight group {: fg :bg (highlight-get-field group :fg)}))

  (set mod.colors dracula-colors)

  (fn mod.setup []
    (set g.dracula_show_end_of_buffer false)
    (set g.dracula_italic_comment true)
    (set o.background :dark)
    (colorscheme :dracula)
    ;; Tabline
    (highlight :TabLine {:fg mod.colors.comment :bg mod.colors.black})
    (highlight :TabLineSel {:fg mod.colors.white :bg mod.colors.bg})
    (highlight :TabLineFill {:bg mod.colors.black})
    ;; vim-matchup
    (highlight :MatchParen {:fg mod.colors.orange :bold true :italic true})
    (highlight :MatchWord {:italic true})
    (highlight-link :MatchupVirtualText :Comment)
    ;; vim-illuminate
    (highlight :IlluminatedWordText {:bg mod.colors.selection})
    (highlight :IlluminatedWordRead {:bg mod.colors.selection})
    (highlight :IlluminatedWordWrite {:bg mod.colors.selection :underline true})
    ;; cmp
    (highlight :PmenuSel {:fg mod.colors.white :bg "#363848"})
    (highlight :CmpCursorLine {:bg "#363848"})
    (highlight :CmpItemAbbr {:fg mod.colors.white :bg :NONE})
    (highlight :CmpItemAbbrMatch {:fg mod.colors.cyan :bg :NONE :bold true})
    (highlight :CmpItemAbbrMatchFuzzy
               {:fg mod.colors.cyan :bg :NONE :bold true})
    (highlight :CmpItemAbbrDeprecated
               {:fg mod.colors.white :bg :NONE :strikethrough true})
    (highlight :CmpItemMenu {:fg mod.colors.purple :bg :NONE :italic true})
    (let [cmp-groups [:CmpItemKindField
                      :CmpItemKindProperty
                      :CmpItemKindEvent
                      :CmpItemKindText
                      :CmpItemKindEnum
                      :CmpItemKindKeyword
                      :CmpItemKindConstant
                      :CmpItemKindConstructor
                      :CmpItemKindReference
                      :CmpItemKindFunction
                      :CmpItemKindStruct
                      :CmpItemKindClass
                      :CmpItemKindModule
                      :CmpItemKindOperator
                      :CmpItemKindVariable
                      :CmpItemKindUnit
                      :CmpItemKindSnippet
                      :CmpItemKindFolder
                      :CmpItemKindMethod
                      :CmpItemKindValue
                      :CmpItemKindEnumMember
                      :CmpItemKindInterface
                      :CmpItemKindColor
                      :CmpItemKindTypeParameter]]
      (each [_ group (pairs cmp-groups)]
        (swap-bg-with-fg mod.colors.black group)))
    (highlight :CmpItemKindFile {:fg mod.colors.black :bg mod.colors.white})
    (highlight :CmpItemKindFolder {:fg mod.colors.black :bg mod.colors.white})
    (highlight :CmpItemKindTabNine
               {:fg mod.colors.black :bg mod.colors.bright_magenta})
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
    (highlight :NeogitCursorLine {:fg mod.colors.fg :bg mod.colors.visual})
    ;; nvim-treesitter
    (highlight-link "@variable.parameter" "@parameter")
    (highlight-link "@variable.member" "@field")
    (highlight-link "@module" "@namespace")
    (highlight-link "@number.float" "@float")
    (highlight-link "@string.special.symbol" "@symbol")
    (highlight-link "@string.regexp" "@string.regex")
    (highlight-link "@markup.strong" "@text.strong")
    (highlight-link "@markup.italic" "@text.emphasis")
    (highlight-link "@markup.underline" "@text.underline")
    (highlight-link "@markup.strikethrough" "@text.strike")
    (highlight-link "@markup.heading" "@text.title")
    (highlight-link "@markup.quote" "@text.quote")
    (highlight-link "@markup.link.url" "@text.uri")
    (highlight-link "@markup.math" "@text.math")
    (highlight-link "@markup.environment" "@text.environment")
    (highlight-link "@markup.environment.name" "@text.environment.name")
    (highlight-link "@markup.link" "@text.reference")
    (highlight-link "@markup.raw" "@text.literal")
    (highlight-link "@markup.raw.block" "@text.literal.block")
    (highlight-link "@markup.link.label" "@string.special")
    (highlight-link "@markup.list" "@punctuation.special")
    (highlight-link "@function.method" "@method")
    (highlight-link "@function.method.call" "@method.call")
    (highlight-link "@comment.todo" "@text.todo")
    (highlight-link "@comment.error" "@text.danger")
    (highlight-link "@comment.warning" "@text.warning")
    (highlight-link "@comment.hint" "@text.note")
    (highlight-link "@comment.info" "@text.note")
    (highlight-link "@comment.note" "@text.note")
    (highlight-link "@comment.ok" "@text.note")
    (highlight-link "@diff.plus" "@text.diff.add")
    (highlight-link "@diff.minus" "@text.diff.delete")
    (highlight-link "@diff.delta" "@text.diff.change")
    (highlight-link "@string.special.url" "@text.uri")
    (highlight-link "@keyword.directive" "@preproc")
    (highlight-link "@keyword.storage" "@storageclass")
    (highlight-link "@keyword.directive" "@define")
    (highlight-link "@keyword.conditional" "@conditional")
    (highlight-link "@keyword.debug" "@debug")
    (highlight-link "@keyword.exception" "@exception")
    (highlight-link "@keyword.import" "@include")
    (highlight-link "@keyword.repeat" "@repeat"))

  mod)
