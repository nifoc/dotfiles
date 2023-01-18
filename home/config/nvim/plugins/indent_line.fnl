(let [indent (require :indent_blankline)]
  (indent.setup {:char "┆"
                 :show_first_indent_level false
                 :use_treesitter true
                 :show_current_context true
                 :context_char "│"
                 :context_patterns [:class
                                    :^func
                                    :method
                                    :^if
                                    :while
                                    :for
                                    :with
                                    :try
                                    :except
                                    :arguments
                                    :argument_list
                                    :object
                                    :dictionary
                                    :map
                                    :element
                                    :list
                                    :table
                                    :sequential_table
                                    :tuple
                                    :do_block
                                    :stab_clause]
                 :buftype_exclude [:help :nofile :prompt :quickfix :terminal]}))

