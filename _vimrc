set fileencodings=ucs-bom,utf-8,chinese
syntax enable
map <F3> :NERDTreeToggle<CR>

"去掉vi的一致性"
""解决windows10下退格键的兼容性
set nocompatible
set backspace=indent,eol,start
"显示行号"
set number
set history=100
" 隐藏滚动条"    
"set guioptions-=r 
set guioptions-=L
set guioptions-=b
"隐藏工具栏
set guioptions-=T
set nobackup
let g:asyncrun_encs='gbk'
set ai
set si
"隐藏顶部标签栏"
set showtabline=0
"设置字体"
set guifont=Consolas\:h11
syntax on   "开启语法高亮
let g:solarized_termcolors=256  "solarized主题设置在终端下的设置"
colorscheme desert
set nowrap  "设置不折行"
set fileformat=unix "设置以unix的格式保存文件"
"设置C样式的缩进格式"
"set cindent     
set shiftwidth=4        "同上"
set showmatch   "显示匹配的括号"
"距离顶部和底部5行"
"set scrolloff=5     
set laststatus=2    "命令行为两行"
set fenc=utf-8      "文件编码"
set backspace=2
set mouse=a     "启用鼠标"
set selection=exclusive
set selectmode=mouse,key
set matchtime=5
"忽略大小写"
"set ignorecase 
set incsearch
set hlsearch        "高亮搜索项"
set whichwrap+=<,>,h,l
set autoread
set cursorline      "突出显示当前行"
set cursorcolumn        "突出显示当前列"
set ts=4
"set expandtab
"set autoindent
set lines=40  columns=150
set ruler "可显示最后一行的状态
set showmode "左下角哪一行的状态
"set bg=dark "设置背景为黑色
let g:SuperTabDefaultCompletionType="context"

hi        CursorColumn                          guibg=grey30           gui=NONE        "光标所在的屏幕列
hi        CursorLine                            guibg=grey30          gui=NONE        "光标所在的屏幕行
hi        NonText        guifg=#007FFF          guibg=#083040           gui=NONE        "窗口尾部的'~'和 '@'



"python 编译
autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"  
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m  
autocmd BufRead *.py nmap <F5> :!python %<CR>  
autocmd BufRead *.py nmap <F6> :make<CR>  
""    autocmd BufRead *.py copen 如果是py文件，则同时打开编译信息窗口 



hi Normal guibg=#083040   guifg=#aabbaa gui=NONE
highlight Comment guifg=#99ccff  guibg=NONE gui=NONE