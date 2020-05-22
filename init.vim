"################################## 插件管理 ##################################
" 关闭文件类型自动检测功能,这个功能被filetype plugin indent on代替          
filetype off

" 自动安装插件管理器(待验证是否可行)
let s:vim_plug_dir=expand('~/.config/nvim/autoload')
if !filereadable(s:vim_plug_dir.'/plug.vim')
  execute '!wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -P '.s:vim_plug_dir
  let s:install_plug=1
endif

" 设置插件的安装位置
call plug#begin('~/.config/nvim/plugged')

" 启动画面插件
Plug 'mhinz/vim-startify'

" 样式
Plug 'gertjanreynaert/cobalt2-vim-theme'

" 自动补全插件
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"自动引号/括号
Plug 'jiangmiao/auto-pairs'

"vim-airline 底部状态栏优化
Plug 'bling/vim-airline'

"nerdtree 文件树
Plug 'scrooloose/nerdtree'

Plug 'rust-lang/rust.vim'

"git插件
"Plug 'tpope/vim-fugitive'

"快速检索移动光标插件
Plug 'easymotion/vim-easymotion'

"工作空间插件
" Plug 'thaerkh/vim-workspace'

"模糊查找插件
Plug 'cloudhead/neovim-fuzzy'

call plug#end()
if exists('s:install_plug')
  augroup PlugInstall
    au!
    au VimEnter * PlugInstall
  augroup END
endif

" 界面样式配置开始 
syntax enable
set background=dark
colorscheme cobalt2
hi CursorLineNr term=bold ctermfg=11 gui=bold guifg=Yellow
hi LineNr term=bold ctermfg=Gray gui=bold guifg=Yellow
" 界面样式配置结束

"##################################按键设置##################################

" F3 开启关闭文件树
nnoremap <F3> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ctrl-j/k/l/h  分屏窗口移动 Normal mode
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h

"##################################插件设置##################################

" *********** NERDTree插件配置 ***********
" 默认打开NERDTree
let NERDTreeChDirMode=2                                         " 设置当前目录为nerdtree的起始目录
let NERDChristmasTree=1                                         " 使得窗口有更好看的效果
let NERDTreeMouseMode=1                                         " 双击鼠标左键打开文件
let NERDTreeWinSize=25                                          " 设置窗口宽度为25
" let NERDTreeQuitOnOpen=1                                        " 打开一个文件时nerdtree分栏自动关闭
" 打开文件默认开启文件树
" autocmd VimEnter * NERDTree

"#################################vim设置##################################
"************常规设置****************
"设置历史操作记录为1000条
set history=1000  
" 不启用vi的键盘模式,而是vim自己的
set nocompatible
" 载入文件类型插件,代替filetype off 
filetype plugin indent on

"************搜索设置***************
" 搜索的时候不区分大小写,是set ignorecase缩写.如果你想启用,输入:set noic(noignorecase缩写)
set ic
" 搜索的时候随字符高亮
set hlsearch

"************编码设置***************
" 设置编码格式为utf-8
set encoding=utf-8
" 自动判断编码时,依次尝试下编码
set fileencodings=utf-8,ucs-bom,GB2312,big5

"************行和列设置***************
" 显示行横线
set cursorline
" 显示行号
set nu

"************缩进设置***************
" 自动套用上一行的缩进方式
set autoindent
" 开智能缩进
set smartindent
" 光标移动到buffer的顶部和底部保持4行继续
set scrolloff=4
" 当光标移动到一个括号时,高亮显示对应的另一个括号
set showmatch

" 对退格键提供更好帮助
set backspace=indent,eol,start   
"自动保存
" let g:auto_save = 1
" let g:auto_save_events = ["InsertLeave", "TextChanged", "TextChangedI", "CursorHoldI", "CompleteDone"]

let g:workspace_autosave_always = 1
let g:workspace_autosave = 0

" 打开文件查找框
nnoremap <C-p> :FuzzyOpen<CR>

"************coc插件配置*************
"使用<tab>补全
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" 打开当前文档的outline和symbols
nnoremap <C-o> :CocList outline<CR>
nnoremap <C-i> :CocList symbols<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let mapleader=","
let g:EasyMotion_keys = "abcdefghijklmnopqrstuvwxyz"
