#!/usr/bin/env zsh
# See: https://github.com/paulreimer/zsh-histdb/tree/master?tab=readme-ov-file#integration-with-zsh-autosuggestions

_zsh_autosuggest_strategy_histdb_top_here() {
  local query="
    select commands.argv from history
    left join commands on history.command_id = commands.rowid
    left join places on history.place_id = places.rowid
    where places.dir LIKE '$(sql_escape $PWD)%'
    and commands.argv LIKE '$(sql_escape $1)%'
    group by commands.argv
    order by count(*) desc
    limit 1
  "

  suggestion=$(_histdb_query "$query")
}

_zsh_autosuggest_strategy_histdb_top() {
  local query="
    select commands.argv from history
    left join commands on history.command_id = commands.rowid
    left join places on history.place_id = places.rowid
    where commands.argv LIKE '$(sql_escape $1)%'
    group by commands.argv, places.dir
    order by places.dir != '$(sql_escape $PWD)', count(*) desc
    limit 1
  "

  suggestion=$(_histdb_query "$query")
}
