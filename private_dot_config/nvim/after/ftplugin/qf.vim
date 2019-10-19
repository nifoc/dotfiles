setlocal nonumber norelativenumber

nnoremap <buffer> <silent> <esc> :q!<CR>
nnoremap <buffer> <silent> q :q!<CR>

autocmd BufWinLeave <buffer> call nifoc#asyncrun#update_status()

let b:toggle_line_style = v:false
