"自动补全
"开启YCM标签引擎
let g:ycm_collect_identifiers_from_tags_files=1
"引入C++标准库tags
set tags+=/data/misc/software/misc./vim/stdcpp.tags
"YCM补全菜单配色
" 菜单
highlight Pmenu ctermfg=84 ctermbg=242 guifg=#ff4400 guibg=#EEE8D5
"选中项
highlight PmenuSel ctermfg=242 ctermbg=84 guifg=#AFD700 guibg=#106900
"侧边标签颜色
highlight YcmErrorSign ctermbg=233 ctermfg=1
highlight YcmWarningSign ctermbg=233 ctermfg=3
"标签框颜色
highlight SignColumn ctermbg=233 ctermfg=10
"滚动条
"highlight PmenuSbar  ctermfg=84 ctermbg=242 guifg=#ff4400 guibg=#EEE8D5
"滚动条的滑块
"highlight PmenuThumb ctermfg=4 ctermbg=2 guifg=#ff4400 guibg=#EEE8D5
"补全内容不以分割子窗口显示，只用列表
set completeopt-=preview
" 补全功能在注释中依然有效
let g:ycm_complete_in_comments=1
"语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
"自动载入.ycm_extra_conf.py
let g:ycm_global_ycm_extra_conf='/home/lxx/.vim/.ycm_extra_conf.py'
"开启/关闭自动补全 1开 0关
let g:ycm_auto_trigger=1
"打开YCM诊断显示 1开 0关
let g:ycm_show_diagnostics_ui=1
"warning行，在装订线上的图标，默认为>>
let g:ycm_warning_symbol='★'
"★ ▲
"erro行，在装订线上的图标，默认为>>
let g:ycm_error_symbol='★'
"将图标放在装订线上 1开启 0关闭
let g:ycm_enable_diagnostic_signs=1
"突出与错误相关的区域
let g:ycm_enable_diagnostic_highlighting=0
"光标在错误行时，显示诊断信息
let g:ycm_echo_current_diagnostic=1
"关闭打开匹配菜单(无法修改)
"let g:ycm_key_list_stop_completion = ['<C-y>', '<c-q>']
"打开自动补全匹配
let g:ycm_key_invoke_completion='<c-e>'
"允许加载.ycm_confirm_extra_conf.py文件，不再提示
let g:ycm_confirm_extra_conf=0
"跳转快捷键 <c-c>跳转到实现，<c-d>跳转到定义 使用<c-o> 跳回上一个记录的标签 <c-i>调到下一个记录的标签
nnoremap <c-c> :YcmCompleter GoToDeclaration<CR>
nnoremap <c-d> :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>i :YcmCompleter GoToInclude<CR>
";jd跳转到定义和实现
"nnoremap <Leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" 函数： leader + y 实现ycm开关
function! OpenOrColseYCM()
    if g:ycm_auto_trigger == 1
        let g:ycm_auto_trigger=0
        echo "关闭ycm"
    else
        let g:ycm_auto_trigger=1
        echo "开启ycm"
    endif
endfunction
" 设置快捷键开关ycm
nnoremap <Leader>y :call OpenOrColseYCM()<CR>
