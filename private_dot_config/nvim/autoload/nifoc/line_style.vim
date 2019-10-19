function! nifoc#line_style#check_disable()
  if &buftype ==# 'terminal' || &buftype ==# 'nofile'
    return v:true
  else
    return v:false
  end
endfunction

function! nifoc#line_style#check_toggle()
  if nifoc#line_style#check_disable()
    return v:false
  else
    return get(b:, 'toggle_line_style', v:true)
  endif
endfunction
