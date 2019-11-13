function! nifoc#highlight_word#syn_stack() abort
  return map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

function! nifoc#highlight_word#syn_attr() abort
  let l:stack = synstack(line("."), col("."))

  if len(stack) > 0
    return synIDattr(l:stack[-1], "name")
  else
    return ''
  endif
endfunction

function! nifoc#highlight_word#check() abort
  let l:search = getreg('/')
  let l:cword = expand('<cword>')

  if match(l:cword, l:search) == -1
    let l:attr = nifoc#highlight_word#syn_attr()
    let l:groups = get(b:, 'syntack_highlight', [])

    if index(l:groups, l:attr) >= 0
      return v:true
    else
      return v:false
    endif
  else
    return v:false
  endif
endfunction
