setlocal nonumber norelativenumber

autocmd BufEnter <buffer> if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let b:toggle_line_style = v:false
