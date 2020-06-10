" 显示文件编码方式
nnoremap <c-e> :set fileencoding<CR> 
" 不区分大小写
set ignorecase
" 智能区分大小写，全小写为不区分，需要先设置ignorecase
set smartcase
" 普通模式下显示正在输入的命令
set showcmd " 将qml识别成javascript
au BufRead,BufNewFile *.qml set filetype=javascript

" 设置折叠方式: 有manual indent expr syntax diff marker
" set fdm=xxx 或 set foldmethod=xxx
" 设置manual手工定义折叠，zf53 <enter> 折叠53行
" 代码折叠 za:打开或关闭折叠 zM:关闭所有折叠 zR:打开所有折叠
" set foldmethod=syntax
" 启动vim时，关闭折叠代码
set nofoldenable
" 设置折叠行的高亮颜色
highlight Folded ctermfg=5 ctermbg=0

" 设置换行符为unix风格
set ff=unix

" leader o 以open执行正在编写的文件
autocmd filetype html noremap <leader>o :!xdg-open %<CR><CR>
autocmd filetype markdown noremap <leader>o :!xdg-open %<CR><CR>
autocmd filetype python noremap <leader>o :!python %<CR><CR>
autocmd filetype plantuml noremap <leader>o :PlantumlOpen<CR><CR>


let g:is_relativenumber = 0
function! Setrelativenumber()
    if g:is_relativenumber == 0
        set relativenumber
        let g:is_relativenumber = 1
    else
        set norelativenumber
        let g:is_relativenumber = 0
    endif
endfunction

" 设置相对行号
nnoremap <c-x> :call Setrelativenumber()<CR>

" v模式对选中的内容进行查找
vnoremap * y/<c-r>"<cr>

" 兼容windows的撤销和反撤销
nnoremap <c-y> <c-r>
nnoremap <c-z> u

inoremap jk <Esc>

function! ReadClangFormatColumnLimit()
    " 获取当前文件的目录
    let l:current_file = expand('%:p')
    let l:dirname = fnamemodify(l:current_file, ':h')

    " 拼接 .clang-format 文件的路径
    let l:clang_format_file = l:dirname . '/.clang-format'

    " 检查文件是否存在
    if !filereadable(l:clang_format_file)
        echomsg "Error: .clang-format file not found."
        return
    endif

    " 读取 .clang-format 文件内容
    let l:clang_format_content = readfile(l:clang_format_file)

    " 查找 ColumnLimit 的值
    for l:line in l:clang_format_content
        if l:line =~ 'ColumnLimit'
            let l:column_limit = matchstr(l:line, '\d\+')
            echomsg "ColumnLimit found: " . l:column_limit
            let l:column_limit = l:column_limit+1
            execute 'set colorcolumn=' . l:column_limit
            return
        endif
    endfor

    echomsg "ColumnLimit not found"
endfunction
" 设置colorcolumn为 .clang-format 中的 ColumnLimit+1
call ReadClangFormatColumnLimit()

lua require('mybase')
