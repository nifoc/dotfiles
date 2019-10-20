setlocal nonumber norelativenumber

nnoremap <buffer> <silent> <esc> :q!<CR>
nnoremap <buffer> <silent> q :q!<CR>

augroup nifoc_qf
  autocmd! * <buffer>
  autocmd BufWinLeave <buffer> call nifoc#asyncrun#update_status()
augroup end

let b:toggle_line_style = v:false
