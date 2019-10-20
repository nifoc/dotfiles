setlocal nonumber norelativenumber

augroup nifoc_nerdtree
  autocmd! * <buffer>
  autocmd BufEnter <buffer> if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup end

let b:toggle_line_style = v:false
