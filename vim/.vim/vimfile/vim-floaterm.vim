"let g:fterm_disable_map=1

"noremap <silent><leader>t :<c-u>FtermToggle<cr>
"tnoremap <silent><leader>t <c-\><c-n>:<c-u>FtermToggle<cr>

" 0 不自动退出， 1 退出但是打印错误信息，2 自动退出
let g:floaterm_autoclose = 2

let g:floaterm_keymap_toggle = '<Leader>t'
tnoremap <c-a> <c-\><c-n>
