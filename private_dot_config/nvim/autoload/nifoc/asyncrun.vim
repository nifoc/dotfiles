function nifoc#asyncrun#toggle() abort
  let asyncrun_status = get(g:, 'asyncrun_status', 'stopped')

  if asyncrun_status !=# 'running' && asyncrun_status !=# 'failure'
    let g:asyncrun_status = 'stopped'
    doautocmd User AsyncRunUpdate
  endif

  call asyncrun#quickfix_toggle(20)
endfunction

function nifoc#asyncrun#maybe_open() abort
  let asyncrun_status = get(g:, 'asyncrun_status', 'stopped')

  if asyncrun_status ==# 'failure'
    call asyncrun#quickfix_toggle(20, 1)
  endif
endfunction

function nifoc#asyncrun#update_status() abort
    let asyncrun_status = get(g:, 'asyncrun_status', 'stopped')

    if asyncrun_status !=# 'running'
      let g:asyncrun_status = 'stopped'
      doautocmd User AsyncRunUpdate
    endif
endfunction
