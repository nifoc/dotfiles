setlocal spell
setlocal textwidth=120
setlocal colorcolumn=+1

augroup nifoc_elixir
  autocmd! * <buffer>
  autocmd BufWritePre <buffer> call nifoc#whitespace#trim()
  autocmd CursorHold <buffer> if nifoc#highlight_word#check() | silent call CocActionAsync('highlight') | endif
augroup end

let b:syntack_highlight = ['elixirAlias', 'elixirArguments', 'elixirAtom', 'elixirId', 'elixirString']
