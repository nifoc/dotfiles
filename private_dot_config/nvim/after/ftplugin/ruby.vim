augroup nifoc_ruby
  autocmd! * <buffer>
  autocmd BufWritePre <buffer> call nifoc#whitespace#trim()
augroup end
