function! nifoc#highlight_word#syn_stack()
  return map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

function! nifoc#highlight_word#syn_attr()
  let stack = synstack(line("."), col("."))

  if len(stack) > 0
    return synIDattr(stack[-1], "name")
  else
    return ''
  endif
endfunction

function! nifoc#highlight_word#check()
  let search = getreg('/')
  let cword = expand('<cword>')

  if match(cword, search) == -1
    let attr = nifoc#highlight_word#syn_attr()
    let groups = get(b:, 'syntack_highlight', [])

    if index(groups, attr) >= 0
      return v:true
    else
      return v:false
    endif
  else
    return v:false
  endif
endfunction
