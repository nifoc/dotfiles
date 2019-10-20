iabbrev <buffer> <= =<

augroup nifoc_erlang
  autocmd! * <buffer>
  autocmd BufWritePre <buffer> call nifoc#whitespace#trim()
augroup end
