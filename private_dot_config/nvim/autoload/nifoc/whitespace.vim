function! nifoc#whitespace#trim()
  let saved_view = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(saved_view)
endfunction
