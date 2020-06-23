function! nifoc#fzf#floating_window() abort
  let s:opening_win = win_getid()
  let s:opening_cursorline = nvim_win_get_option(s:opening_win, 'cursorline')
  let s:opening_colorcolumn = nvim_win_get_option(s:opening_win, 'colorcolumn')
  call nvim_win_set_option(s:opening_win, 'cursorline', v:false)
  call nvim_win_set_option(s:opening_win, 'colorcolumn', '')

  " Center
  let l:height = winheight(0) - 20
  let l:width = winwidth(0)- 60
  let l:row = float2nr((winheight(0) - l:height) / 2)
  let l:col = float2nr((winwidth(0) - l:width) / 2)

  " Border
  let border_opts = {
        \ 'relative': 'editor',
        \ 'row': l:row - 1,
        \ 'col': l:col - 2,
        \ 'width': l:width + 4,
        \ 'height': l:height + 2,
        \ 'style': 'minimal'
        \ }

  let l:border_horizontal = ["\u256D" . repeat("\u2500", l:width + 2) . "\u256E"]

  let l:i = 0
  while l:i < l:height
    call add(l:border_horizontal, "\u2502" . repeat(' ', l:width + 2) . "\u2502")
    let l:i += 1
  endwhile

  call add(l:border_horizontal, "\u2570" . repeat("\u2500", l:width + 2) . "\u256F")

  let l:border_buf = nvim_create_buf(v:false, v:true)
  call nvim_buf_set_lines(l:border_buf, 0, 0, v:true, l:border_horizontal)
  let s:fzf_border_win = nvim_open_win(l:border_buf, v:true, l:border_opts)
  call nvim_win_set_option(s:fzf_border_win, 'winhl', 'Normal:NifocFloatBorder')
  call nvim_win_set_option(s:fzf_border_win, 'winblend', 5)

  " FZF Window
  let opts = {
        \ 'relative': 'editor',
        \ 'row': l:row,
        \ 'col': l:col,
        \ 'width': l:width,
        \ 'height': l:height,
        \ 'style': 'minimal'
        \ }

  let l:buf = nvim_create_buf(v:false, v:true)
  let l:win = nvim_open_win(l:buf, v:true, l:opts)
  call nvim_win_set_option(win, 'winblend', 5)

  autocmd BufWipeout <buffer> call s:OnUnload()

  return l:win
endfunction

function! nifoc#fzf#smart_file_list() abort
  let l:fzf_custom_file_list = get(g:, 'fzf_custom_file_list', $FZF_DEFAULT_COMMAND)
  call nifoc#fzf#file_list(l:fzf_custom_file_list)
endfunction

function! nifoc#fzf#file_list(cmd) abort
  let s:file_list = []

  let l:callbacks = {
    \ 'on_stdout': function('s:OnEvent'),
    \ 'on_exit': function('s:OnExit')
    \ }

  call jobstart(a:cmd.' | devicon-lookup', l:callbacks)
endfunction

function! nifoc#fzf#rg_live(query, fullscreen) abort
  let command_fmt = 'rg --column --line-number --no-heading --max-columns=120 --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}

  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

function! s:EditDeviconPrependedFiles(items) abort
  let l:items = a:items

  let l:i = 1
  let l:length = len(l:items)
  while l:i < l:length
    let l:item = l:items[i]
    let pos = stridx(l:item, ' ')
    let l:items[i] = l:item[l:pos+1:-1]
    let l:i += 1
  endwhile

  call s:Sink(l:items)
endfunction

function! s:OnEvent(job_id, data, event) abort
  let l:items = a:data
  call filter(l:items, 'v:val != ""')
  call extend(s:file_list, l:items)
endfunction

function! s:OnExit(job_id, data, event) abort
  let l:head_lines = winheight(0) - 22

  let l:fzf_opts = fzf#wrap({
    \ 'source': s:file_list,
    \ })
  let s:Sink = l:fzf_opts['sink*']
  let l:fzf_opts['sink*'] = function('s:EditDeviconPrependedFiles')
  let l:fzf_opts.options .= ' -m --preview "highlight --base16 --style=gruvbox-dark-medium -O truecolor -l -j 2 --line-range=1-' . l:head_lines . ' --force {2..-1}"'

  call fzf#run(l:fzf_opts)
endfunction

function! s:OnUnload()
  call nvim_win_close(s:fzf_border_win, v:true)
  call nvim_win_set_option(s:opening_win, 'cursorline', s:opening_cursorline)
  call nvim_win_set_option(s:opening_win, 'colorcolumn', s:opening_colorcolumn)
endfunction
