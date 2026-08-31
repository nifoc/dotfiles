(import-macros {: highlight} :../macros/cmd)

(let [ai (require :mini.ai)
      clue (require :mini.clue)
      cmt (require :mini.comment)
      cursorword (require :mini.cursorword)
      files (require :mini.files)
      icons (require :mini.icons)
      move (require :mini.move)
      notify (require :mini.notify)
      operators (require :mini.operators)
      pairs (require :mini.pairs)
      snippets (require :mini.snippets)
      surround (require :mini.surround)
      theme (require :nifoc.theme)
      augroup (vim.api.nvim_create_augroup :NifocMini {:clear true})
      aucmd vim.api.nvim_create_autocmd]
  ;; ai
  (ai.setup)
  ;; clue
  (clue.setup {:triggers [;; Leader
                          {:mode :n :keys :<Leader>}
                          {:mode :x :keys :<Leader>}
                          ;; g
                          {:mode :n :keys :g}
                          {:mode :x :keys :g}
                          ;; Registers
                          {:mode :n :keys "\""}
                          {:mode :x :keys "\""}
                          {:mode :i :keys :<C-r>}
                          {:mode :c :keys :<C-r>}
                          ;; Window
                          {:mode :n :keys :<C-w>}
                          ;; z
                          {:mode :n :keys :z}
                          {:mode :x :keys :z}]
               :clues [(clue.gen_clues.g)
                       (clue.gen_clues.registers)
                       (clue.gen_clues.windows)
                       (clue.gen_clues.z)]})
  ;; comment
  (cmt.setup)
  ;; cursorword
  (cursorword.setup)
  (highlight :MiniCursorword {:bg theme.colors.selection})
  ;; files
  (files.setup)
  ;; icons
  (icons.setup)
  ;; move
  (move.setup {:mappings {:left :<A-Left>
                          :right :<A-Right>
                          :down :<A-Down>
                          :up :<A-Up>
                          :line_left :<A-Left>
                          :line_right :<A-Right>
                          :line_down :<A-Down>
                          :line_up :<A-Up>}})
  ;; notify
  (notify.setup {:window {:max_width_share 0.5}})
  (set vim.notify (notify.make_notify))
  ;; operators
  (operators.setup)
  ;; pairs
  (pairs.setup)
  ;; snippets
  (snippets.setup)
  (highlight :MiniSnippetsCurrent
             {:fg nil :bg nil :sp theme.colors.orange :underdotted true})
  (highlight :MiniSnippetsCurrentReplace
             {:fg nil :bg nil :sp theme.colors.red :underdotted true})
  (highlight :MiniSnippetsFinal
             {:fg nil :bg nil :sp theme.colors.green :underdotted true})
  (highlight :MiniSnippetsUnvisited
             {:fg nil :bg nil :sp theme.colors.cyan :underdotted true})
  (highlight :MiniSnippetsVisited
             {:fg nil :bg nil :sp theme.colors.purple :underdotted true})
  (aucmd :User {:pattern :MiniSnippetsSessionJump
                :callback #(when (= $1.data.tabstop_to :0)
                             (snippets.session.stop))
                :group augroup
                :desc "Stop session on final tabstop"})
  (aucmd :ModeChanged
         {:pattern "*:n"
          :callback #(while (snippets.session.get) (snippets.session.stop))
          :group augroup
          :desc "Stop sessions on normal mode exit"})
  ;; surround
  (surround.setup))
