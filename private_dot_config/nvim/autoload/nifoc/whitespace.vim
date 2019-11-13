function! nifoc#whitespace#trim() abort
  let l:saved_view = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:saved_view)
endfunction
