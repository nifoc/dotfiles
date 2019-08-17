function! LightlineMode()
  return &filetype ==# 'denite' ? 'Denite' :
       \ &filetype ==# 'vim-plug' ? 'Plug' :
       \ lightline#mode()
endfunction

function! LightlineTabFilename(n) abort
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let _ = expand('#'.buflist[winnr - 1].':t')

  return _ ==# '' ? '[No Name]' :
       \ _ =~? 'fzf' ? '[FZF]' :
       \ _
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightlineTabModified(n) abort
  let winnr = tabpagewinnr(a:n)
  return gettabwinvar(a:n, winnr, '&modified') ? "\uF8EA" : gettabwinvar(a:n, winnr, '&modifiable') ? '' : "\uF8ED"
endfunction

function! LightlineTabNum(n) abort
  let l:number_map = get(g:, 'lightline_tab_num_map', {})
  let l:number = a:n
  let l:result = ''

  for i in range(1, strlen(l:number))
    let l:result = get(l:number_map, l:number % 10, l:number % 10) . l:result
    let l:number = l:number / 10
  endfor

  return l:result
endfunction

function! LightlineNearestMethodOrFunction() abort
  let l:fn = get(b:, 'vista_nearest_method_or_function', '')
  return strlen(l:fn) > 0 ? "\uf794 ".l:fn : ''
endfunction

function! LightlineAleWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:all_non_errors == 0 ? '' : printf("\uF071".' %d', all_non_errors)
endfunction

function! LightlineAleErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:all_errors == 0 ? '' : printf("\uF00D".' %d', all_errors)
endfunction

function! LightlineAleOK() abort
  if ale#engine#IsCheckingBuffer(bufnr(''))
    return "\uF6D7"
  else
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? "\uF00C" : ''
  endif
endfunction

function! LightlineAleFixer() abort
  let l:all_fixers = get(g:, 'ale_fixers', {})
  let l:fixer_ft = get(l:all_fixers, &filetype, [])
  return len(l:fixer_ft) > 0 ? "\uF77B" : ''
endfunction

function! LightlineSpellcheckEnabled() abort
  return &spell == 0 ? '' : "\uFB92"
endfunction

function! LightlineGit() abort
  let l:status = get(b:, 'coc_git_status', '')

  if strlen(l:status) > 0
    let l:status = trim(l:status)
    let l:status = substitute(l:status, '+', "\uF457 ", "")
    let l:status = substitute(l:status, '\~', "\uF459 ", "")
    let l:status = substitute(l:status, '-', "\uF458 ", "")

    return l:status
  else
    return ''
  endif
endfunction

function! LightlineAsyncRunStatus() abort
  let l:asyncrun_status = get(g:, 'asyncrun_status', 'stopped')
  let l:asyncrun_code = get(g:, 'asyncrun_code', '1')

  if l:asyncrun_status ==# 'running'
    return "\uF085".' Running'
  elseif l:asyncrun_status ==# 'success'
    return "\uF085".' Success'
  elseif l:asyncrun_status ==# 'failure'
    return "\uF085".' Failure ('.l:asyncrun_code.')'
  else
    return ''
  endif
endfunction

augroup LightLineHooks
  autocmd!
  autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
  autocmd User ALEFixPre call lightline#update()
  autocmd User ALEFixPost call lightline#update()
  autocmd User ALELintPre call lightline#update()
  autocmd User ALELintPost call lightline#update()
  autocmd User CocDiagnosticChange call lightline#update()
  autocmd User AsyncRunPre call lightline#update()
  autocmd User AsyncRunStart call lightline#update()
  autocmd User AsyncRunStop call lightline#update()
  autocmd User AsyncRunUpdate call lightline#update()
augroup end
