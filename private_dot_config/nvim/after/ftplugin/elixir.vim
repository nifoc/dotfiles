setlocal spell

autocmd BufWritePre <buffer> call nifoc#whitespace#trim()

let b:syntack_highlight = ['elixirAlias', 'elixirArguments', 'elixirAtom', 'elixirId', 'elixirString']
