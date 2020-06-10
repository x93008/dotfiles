if empty(glob('~/.vim/autoload/plug.vim')) && !has('win32')
    silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    silent execute "!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" vim背景透明
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE " transparent bg
            
" 修改弹窗颜色, 内置终端和补全会受到影响
:hi Pmenu ctermbg=23m  "for vim

"统一缩进为4
set softtabstop=4
" 这个属性影响>> <<的宽度，但是实际上也会影响tab宽度
set shiftwidth=4
"tab=4
set tabstop=4

" 终端256颜色
" export TERM=xterm-256color

" hi! Normal ctermfg=251 ctermbg=235

"plug 插件列表
call plug#begin()
"下载列编辑插件
"Plug 'terryma/vim-multiple-cursors'
"下载c++11语法高亮
Plug 'octol/vim-cpp-enhanced-highlight'
"下载可视化缩进模块
Plug 'nathanaelkane/vim-indent-guides'
"语法补全插件
"Plug 'Valloric/YouCompleteMe'
"Plug 'ycm-core/YouCompleteMe'
" 全语言补全插件, 取代ycm
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"由接口快速生成实现文件
"Plug 'derekwyatt/vim-protodef'
" 接口实现补丁的依赖补丁:此补丁可以快速在.h 和 .cpp文件中切换
Plug 'derekwyatt/vim-fswitch'
"plantuml语法插件
Plug 'aklt/plantuml-syntax'
" plantuml 浏览器预览插件, 需要安装graphviz命令
Plug 'weirongxu/plantuml-previewer.vim'
" 浏览器打开插件，plantuml-previewer依赖
Plug 'tyru/open-browser.vim'
"vim-tmux窗口移动无缝衔接
Plug 'christoomey/vim-tmux-navigator'
"Doxygen自动注释插件
Plug 'vim-scripts/DoxygenToolkit.vim'
" 用于显示状态栏
Plug 'itchyny/lightline.vim'

" 主题色扩展，通过colorscheme指定colorscheme指定
Plug 'flazz/vim-colorschemes'


" NerdTree目录, neovim会有问题,
" 已经替换为https://github.com/weirongxu/coc-explorer
" Plug 'scrooloose/nerdtree'
" Plug 'preservim/nerdtree'

"cht插件 可能导致<S-k>出问题
"Plug 'dbeniamine/cheat.sh-vim'
"log 语法插件
Plug 'MTDL9/vim-log-highlighting'
"clangformate neoformat 按照语法进行格式化，会自动读取clangformat
"被coc取代
"Plug 'sbdchd/neoformat'
"自动生成ycm文件 <c-y>
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
"命令模式自动中止中文输入法 未生效
Plug 'lilydjwg/fcitx.vim', { 'branch': 'fcitx5' }
"ack 搜索插件
Plug 'mileszs/ack.vim'
"qml 语法高亮插件
"Plug 'crucerucalin/qml.vim'
" javascript语法高亮
" Plug 'pangloss/vim-javascript'
" javascript YCM补全插件
"Plug 'marijnh/tern_for_vim'
" 自己配置的tab补全,需要写配置文件
" Plug 'SirVer/ultisnips'
" 注释
Plug 'scrooloose/nerdcommenter'
" react高亮插件
"Plug 'maxmellon/vim-jsx-pretty'
" vim-markdown-previeu: 自动生成一个临时的html文件，用于渲染markdown语法，并用浏览器打开
"Plug 'JamshedVesuna/vim-markdown-preview'
" vim-instant-markdown: 在浏览器中打开markdown, 依赖npm -g install instant-markdown-d, nvm 切换node后可能需要重新下载
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
" 甩锅插件，用于查看每行代码的提交者
Plug 'zivyangll/git-blame.vim'

" 全语法高亮
Plug 'sheerun/vim-polyglot'
" 翻译
"Plug 'voldikss/vim-translator'
Plug 'iamcco/dict.vim'
" 终端弹窗
"Plug 'ZhiyuanLck/vim-float-terminal'
Plug 'voldikss/vim-floaterm'
" 小游戏
Plug 'vim/killersheep'

" 递归搜索结果放到同一文件统一修改查看, 需要安装ripgrep
Plug 'dyng/ctrlsf.vim'


call plug#end()
"PlugInstall PlugUpdate PlugClean


"修改vim的leader键
let mapleader = ';'
let maplocalleader = ','

"PlugInstall 安装插件
"PlugInstall [name ...] [#threads] 安装指定插件
"PlugUpdate [name ...] [#threads] 更新插件
"PlugClean[!] 删除未列出的插件

"配置可视化缩进
"IndentGuidesEnable
"IndentGuidesDisable
"IndentGuidesToggle
"随vim自动启动
let g:indent_guides_enable_on_vim_startup=1
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 m 开/关缩进可视化
:nmap <silent> <Leader>m <Plug>IndentGuidesToggle

" 缩进色块为黑色
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black   ctermbg=237
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=black ctermbg=237

"接口实现补丁protodef配置
"成员函数实现和声明顺序一致
let g:disable_protodef_sorting=1
"设置pullproto.pl脚本位置
let g:protodefprotogetter='~/.vim/bundle/protodef/pullproto.pl'


"禁用上下左右方向键
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"自动缩进
"set autoindent
"set cindent

"设置根据不同语言，智能缩进
filetype indent on

"space代替table
set expandtab

"语法高亮
syntax on

"光标不闪烁
set gcr=a:block-blinkon0

"将打开NERDTree打开和隐藏设为 leader+n
" map <Leader>n :NERDTreeToggle<cr>

"关闭兼容模式
set nocompatible

"开启文件类型侦测
filetype on
"根据文件类型，加载对应插件
filetype plugin on

"高亮显示搜索结果
set hlsearch

"设置ctrl + s 为保存
map <c-s> :w<CR>

"   行列设置
"   属性设置
"显示行号
set number
"高亮当前行(带下划线)
set cursorline
"高亮当前列
"set cursorcolumn
"   行列色彩设置
"   cterm: blod(粗体) underline(下划线) reverse(反色) italic(斜体) none
"当前行配色为粗体
hi CursorLine term=bold cterm=bold guibg=Grey40
"当前行号配色
hi CursorLineNr term=bold cterm=italic ctermfg=green guibg=Grey40

" vim主题
colorscheme sonofobsidian

"鼠标相关设置
"启用鼠标:
"   n(普通模式)、 "v(可视模式)、i(插入模式)、c(命令行模式)
"   h(帮助文档里的以上所有模式)
"   a 以上所有模式
set mouse=a

source ~/.vim/vimfile/mybase.vim
source ~/.vim/vimfile/vim-tmux-navigator.vim
source ~/.vim/vimfile/DoxygenToolkit.vim
source ~/.vim/vimfile/coc.vim
source ~/.vim/vimfile/nerdcommenter.vim
source ~/.vim/vimfile/vim-instant-markdown.vim
source ~/.vim/vimfile/dict.vim
source ~/.vim/vimfile/vim-floaterm.vim
source ~/.vim/vimfile/vim-polyglot.vim
source ~/.vim/vimfile/fcitx.vim
source ~/.vim/vimfile/git-blame.vim
source ~/.vim/vimfile/ack.vim
source ~/.vim/vimfile/coc-explorer.vim
source ~/.vim/vimfile/lightline.vim

set t_Co=256
