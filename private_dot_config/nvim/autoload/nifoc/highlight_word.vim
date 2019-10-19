function! nifoc#highlight_word#syn_stack()
  return map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

function! nifoc#highlight_word#check()
  let search = getreg('/')
  let cword = expand('<cword>')

  if match(cword, search) == -1
    let stack = nifoc#highlight_word#syn_stack()
    let groups = get(b:, 'syntack_highlight', [])

    if len(stack) > 0 && len(groups) > 0 && index(groups, stack[-1]) >= 0
      return v:true
    else
      return v:false
    endif
  else
    return v:false
  endif
endfunction
