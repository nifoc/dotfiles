function! nifoc#fzf#floating_window()
  let s:opening_win = win_getid()
  let s:opening_cursorline = nvim_win_get_option(s:opening_win, 'cursorline')
  call nvim_win_set_option(s:opening_win, 'cursorline', v:false)

  " Center
  let height = winheight(0) - 20
  let width = winwidth(0)- 60
  let row = float2nr((winheight(0) - height) / 2)
  let col = float2nr((winwidth(0) - width) / 2)

  " Border
  let border_opts = {
        \ 'relative': 'editor',
        \ 'row': row - 1,
        \ 'col': col - 2,
        \ 'width': width + 4,
        \ 'height': height + 2,
        \ 'style': 'minimal'
        \ }

  let border_horizontal = ["\u256D" . repeat("\u2500", width + 2) . "\u256E"]

  let i = 0
  while i < height
    call add(border_horizontal, "\u2502" . repeat(' ', width + 2) . "\u2502")
    let i += 1
  endwhile

  call add(border_horizontal, "\u2570" . repeat("\u2500", width + 2) . "\u256F")

  let border_buf = nvim_create_buf(v:false, v:true)
  call nvim_buf_set_lines(border_buf, 0, 0, v:true, border_horizontal)
  let s:fzf_border_win = nvim_open_win(border_buf, v:true, border_opts)
  call nvim_win_set_option(s:fzf_border_win, 'winhl', 'Normal:NifocFloatBorder')
  call nvim_win_set_option(s:fzf_border_win, 'winblend', 5)

  " FZF Window
  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }

  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)
  call nvim_win_set_option(win, 'winblend', 5)

  autocmd BufUnload <buffer> call s:OnUnload()

  return win
endfunction

function! nifoc#fzf#smart_file_list()
  let fzf_custom_file_list = get(g:, 'fzf_custom_file_list', $FZF_DEFAULT_COMMAND)
  call nifoc#fzf#file_list(fzf_custom_file_list)
endfunction

function! nifoc#fzf#file_list(cmd)
  let s:file_list = []

  let s:fzf_opts = fzf#wrap({})
  let s:Sink = s:fzf_opts['sink*']
  let s:fzf_opts['sink*'] = function('s:EditDeviconPrependedFiles')
  let head_lines = winheight(0) - 22
  let s:fzf_opts.options .= ' -m --preview "highlight --base16 --style=gruvbox-dark-medium -O truecolor -l -j 2 --line-range=1-' . head_lines . ' --force {2..-1}"'

  let callbacks = {
    \ 'on_stdout': function('s:OnEvent'),
    \ 'on_exit': function('s:OnExit')
    \ }
  call jobstart(a:cmd.' | devicon-lookup', callbacks)
endfunction

function! s:EditDeviconPrependedFiles(items)
  let items = a:items

  let i = 1
  let length = len(items)
  while i < length
    let item = items[i]
    let pos = stridx(item, ' ')
    let items[i] = item[pos+1:-1]
    let i += 1
  endwhile

  call s:Sink(items)
endfunction

function! s:OnEvent(job_id, data, event)
  let items = a:data
  call filter(items, 'v:val != ""')
  call extend(s:file_list, items)
endfunction

function! s:OnExit(job_id, data, event)
  let s:fzf_opts.source = s:file_list
  call fzf#run(s:fzf_opts)
endfunction

function! s:OnUnload()
  call nvim_win_close(s:fzf_border_win, v:true)
  call nvim_win_set_option(s:opening_win, 'cursorline', s:opening_cursorline)
endfunction
