" 注释插件配置
" 该插件可以根据文件类型，选择注释方法
" leader cc 注释
" leader cu 取消注释
" leader cA 在行尾添加注释
" leader c space 注释/取消注释

" 取消默认映射
let g:NERDCreateDefaultMappings = 0

" leader c注释和取消注释
" nmap <leader>l <leader>c<space>
" vmap <leader>l <leader>c<space>
" NERDCommenterToggle
nmap <leader>l <plug>NERDCommenterToggle
vmap <leader>l <plug>NERDCommenterToggle

" 取消注释时，启用尾随的空白修剪
let g:NERDTrimTrailingWhitespace = 1

" let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' } }
" let g:NERDCustomDelimiters = { 'cpp': { 'left': '/*','right': '*/' } }

" 注释符后面增加空格
let g:NERDSpaceDelims = 1

" 对美化的多行注释使用紧凑语法
let g:NERDCompactSexyComs = 1

" 对齐行注释分隔符向左对齐以下代码缩进
let g:NERDDefaultAlign = 'left'

" 检查所选的行是否带有注释
let g:NERDToggleCheckAllLines = 1

" 允许注释空行
let g:NERDCommentEmptyLines = 1


" 下面的脚本是为了让vue自动识别是html还是js
let g:ft = ''
fu! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        let syn = tolower(syn)
        exe 'setf '.syn
      endif
    endif
  endif
endfu
fu! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfu
