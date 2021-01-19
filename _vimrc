set fileencodings=ucs-bom,utf-8,chinese
syntax enable
syntax on   "开启语法高亮
autocmd GUIEnter * simalt ~x "打开为全屏
map <F3> :NERDTreeToggle<CR>
let g:SuperTabDefaultCompletionType="context"

"自动保存和加载当前视图
au BufWinLeave *  mkview
au BufWinEnter *  silent loadview

"添加注释"
map - ^[^xx^[$xx^[
map <F9> <Esc>i//========    ========//<Esc>

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
"set guioptions-=m
set showtabline=1
"设置字体"
"set guifont=VL\ Gothic\ 12 "linux
set guifont=Consolas::h12   "widndows

let g:solarized_termcolors=256  "solarized主题设置在终端下的设置"
"colorscheme desert
colorscheme peachpuff
"set nowrap  "设置不折行"
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
"set selection=exclusive
"set selectmode=mouse,key
set matchtime=5
"忽略大小写"
"set ignorecase 
"set incsearch
set hlsearch        "高亮搜索项"
"set whichwrap+=<,>,h,l
set autoread
set cursorline      "突出显示当前行"
set cursorcolumn        "突出显示当前列"
set ts=8
set expandtab
"set autoindent
set lines=40  columns=150
set ruler "可显示最后一行的状态
set showmode "左下角哪一行的状态
set noswapfile "设置不产生swp文件
"set bg=dark "设置背景为黑色


"hi      NonText                 guifg=#007FFF           guibg=#284868           gui=NONE        "窗口尾部的'~'和 '@'
"hi      NonText                 guifg=#083040           guibg=#083040           gui=NONE        "窗口尾部的'~'和 '@'
"supertab 菜单和下拉框
hi      Pmenu                   ctermbg=5           guibg=#909090      guifg=#751515
hi      PmenuSel                ctermbg=7           guibg=#157575      guifg=#151515
"veilog 语法高亮
"hi      verilogOperator         guifg=#dbb666       guibg=NONE         gui=NONE        cterm=bold " ; , [ ] { } ( )
"hi      verilogStatement        guifg=#dbb666       guibg=NONE         gui=NONE        term=bold       ctermfg=3       gui=bold " begin end
"hi      verilogLable            guifg=#dbb666       guibg=NONE         gui=NONE        term=bold       ctermfg=3       gui=bold " inout input wire reg ......
"hi      verilogConditional      guifg=#dbb666       guibg=NONE         gui=NONE        term=bold       ctermfg=3       gui=bold " inout input wire reg ......
"hi      StatusLineNC            guibg=#000000       guifg=#ffffff      ctermfg=White ctermbg=Black term=none cterm=none gui=none  "状态栏



"hi StatusLineNC guibg=#31312D guifg=#526A83 ctermfg=White ctermbg=Black term=none cterm=none gui=none  "状态栏


"python 编译
autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"  
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m  
autocmd BufRead *.py nmap <F5> :!python %<CR>  
autocmd BufRead *.py nmap <F6> :make<CR>  
""    autocmd BufRead *.py copen 如果是py文件，则同时打开编译信息窗口 

"蓝色背景
"hi      Normal                  guibg=#0f4065           guifg=#aabbaa           gui=NONE        "窗口颜色设置
"hi      NonText                 guifg=#007FFF           guibg=#0f4065           gui=NONE        "窗口尾部的'~'和 '@'
"hi      Comment                 guifg=#99ccff           guibg=NONE              gui=NONE        "注释颜色
"hi      CursorColumn                                    guibg=grey30            gui=NONE        "光标所在的屏幕列
"hi      CursorLine                                      guibg=grey30            gui=NONE        "光标所在的屏幕行

"护眼色背景
hi      Visual                  guibg=#5f5f5f           guifg=#cc7474           gui=NONE        "可视区域颜色
hi      Normal                  guibg=#c7edcc           guifg=#0f0f0f           gui=NONE        "窗口颜色设置
hi      NonText                 guifg=#007FFF           guibg=#c7edcc           gui=NONE        "窗口尾部的'~'和 '@'
hi      Comment                 guifg=#554488           guibg=NONE              gui=NONE        "注释颜色
hi      CursorColumn                                    guibg=grey80            gui=NONE        "光标所在的屏幕列
hi      CursorLine                                      guibg=grey80            gui=NONE        "光标所在的屏幕行



