(import-macros {: highlight-link} :../macros/cmd)

(let [context (require :treesitter-context)]
  (context.setup {:separator "─"})
  (highlight-link :TreesitterContextSeparator :StatusLineNC))
