{:cmd [:bash-language-server :start]
 :root_markers [:.git]
 :filetypes [:bash :sh]
 :settings {:bashIde {:globPattern (or vim.env.GLOB_PATTERN
                                       "*@(.sh|.inc|.bash|.command)")}}}
