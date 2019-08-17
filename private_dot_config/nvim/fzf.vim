function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = &lines - 6
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': 1,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction

function! FzfSmartFileList()
  let l:fzf_custom_file_list = get(g:, 'fzf_custom_file_list', $FZF_DEFAULT_COMMAND)
  call FzfFileList(l:fzf_custom_file_list)
endfunction

function! FzfFileList(cmd)
  let s:file_list = ['']
  let s:callbacks = {
    \ 'on_stdout': 'OnEvent',
    \ 'on_exit': 'OnExit'
    \ }

  function! s:EditDeviconPrependedFiles(items)
    let l:items = a:items
    let l:i = 1
    let l:ln = len(l:items)

    while l:i < l:ln
      let l:item = l:items[i]
      let l:pos = stridx(l:item, ' ')
      let l:file_path = l:item[l:pos+1:-1]
      let l:items[i] = l:file_path
      let l:i += 1
    endwhile

    call s:Sink(l:items)
  endfunction

  let s:fzf_opts = fzf#wrap({})
  let l:head_lines = &lines - 6 - 2
  " let s:fzf_opts.options .= ' -m --preview "bat --theme="base16" --style=numbers,changes --color always {2..-1} | head -'.l:head_lines.'"'
  let s:fzf_opts.options .= ' -m --preview "highlight --base16 --style=gruvbox-dark-medium -O truecolor -l -j 2 --line-range=1-'.l:head_lines.' --force {2..-1}"'

  function! OnEvent(job_id, data, event)
    let s:file_list[-1] .= a:data[0]
    call extend(s:file_list, a:data[1:])
  endfunction

  function! OnExit(job_id, data, event)
    let s:fzf_opts.source = s:file_list
    let s:Sink = s:fzf_opts['sink*']
    let s:fzf_opts['sink*'] = function('s:EditDeviconPrependedFiles')
    call fzf#run(s:fzf_opts)
  endfunction

  call jobstart(a:cmd.' | devicon-lookup', s:callbacks)
endfunction
