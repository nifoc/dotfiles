augroup nifoc_javascript
  autocmd! * <buffer>
  autocmd BufWritePre <buffer> call nifoc#whitespace#trim()
augroup end
