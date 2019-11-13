function nifoc#asyncrun#toggle() abort
  let l:asyncrun_status = get(g:, 'asyncrun_status', 'stopped')

  if l:asyncrun_status isnot# 'running' && l:asyncrun_status isnot# 'failure'
    let g:asyncrun_status = 'stopped'
    doautocmd User AsyncRunUpdate
  endif

  call asyncrun#quickfix_toggle(20)
endfunction

function nifoc#asyncrun#maybe_open() abort
  let l:asyncrun_status = get(g:, 'asyncrun_status', 'stopped')

  if l:asyncrun_status is# 'failure'
    call asyncrun#quickfix_toggle(20, 1)
  endif
endfunction

function nifoc#asyncrun#update_status() abort
  let l:asyncrun_status = get(g:, 'asyncrun_status', 'stopped')

  if l:asyncrun_status isnot# 'running'
    let g:asyncrun_status = 'stopped'
    doautocmd User AsyncRunUpdate
  endif
endfunction
