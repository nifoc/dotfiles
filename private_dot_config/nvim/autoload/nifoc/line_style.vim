function! nifoc#line_style#check_disable() abort
  return &buftype is# 'terminal' || &buftype is# 'nofile'
endfunction

function! nifoc#line_style#check_toggle() abort
  if nifoc#line_style#check_disable()
    return v:false
  else
    return get(b:, 'toggle_line_style', v:true)
  endif
endfunction
