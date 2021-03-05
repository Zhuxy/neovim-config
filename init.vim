
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

"自动引号/括号
Plug 'jiangmiao/auto-pairs'

"vim-airline 底部状态栏优化
Plug 'bling/vim-airline'

"nerdtree 文件树
Plug 'scrooloose/nerdtree'

" plugin for rust
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'

" plugin for markdown
Plug 'plasticboy/vim-markdown'

"git插件
"Plug 'tpope/vim-fugitive'

" 高亮yank的内容, 并持续10s
Plug 'machakann/vim-highlightedyank'
let g:highlightedyank_highlight_duration = 10000

"快速检索移动光标插件
Plug 'easymotion/vim-easymotion'

"工作空间插件
" Plug 'thaerkh/vim-workspace'

"模糊查找插件
Plug 'cloudhead/neovim-fuzzy'

" 括号引号配对
Plug 'andymass/vim-matchup'

" html/xml速写
Plug 'mattn/emmet-vim'

" JavaScript support
Plug 'pangloss/vim-javascript'

" TypeScript syntax
Plug 'leafgarland/typescript-vim'

" JS and JSX syntax
Plug 'maxmellon/vim-jsx-pretty'

" TSX support
Plug 'peitalin/vim-jsx-typescript'

" debugger plugin
" Plug 'puremourning/vimspector'

" language client 插件
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" nvim-lsp 插件
Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-lsp'
Plug 'ervandew/supertab'
Plug 'Chiel92/vim-autoformat'

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

" hi CursorLine gui=underline cterm=underline
" 界面样式配置结束

"##################################按键设置##################################

" F3 开启关闭文件树
nnoremap <F3> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" move to line end/start
nmap <silent> ge $
nmap <silent> gb ^

let mapleader=","
let g:EasyMotion_keys = "abcdefghijklmnopqrstuvwxyz"

" 打开注册表(粘贴板)
nmap <leader>p :reg<CR>

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

" use mouse in all mode
set mouse=nvi

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
"
set ts=4
set expandtab
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
" "使用<tab>补全
" "inoremap <silent><expr> <TAB>
" "      \ pumvisible() ? "\<C-n>" :
" "      \ <SID>check_back_space() ? "\<TAB>" :
" "      \ coc#refresh()
" "inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
"
" " Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>
"
" " 打开当前文档的outline和symbols
" nnoremap <C-i> :CocList outline<CR>
" " nnoremap <C-i> :CocList symbols<CR>
"
" function! s:show_documentation()
"   if &filetype == 'vim'
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

"************coc插件配置 end *************

"************nvim-lsp 插件配置 start *************
" setup rust_analyzer LSP (IDE features)

lua require'lspconfig'.rust_analyzer.setup{}

" Use LSP omni-completion in Rust files
autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Enable deoplete autocompletion in Rust files
let g:deoplete#enable_at_startup = 1

" customise deoplete                                                                                                                                                     " maximum candidate window length
call deoplete#custom#source('_', 'max_menu_width', 80)

" Press Tab to scroll _down_ a list of auto-completions
let g:SuperTabDefaultCompletionType = "<c-n>"

" rustfmt on write using autoformat
autocmd BufWrite * :Autoformat

"TODO: clippy on write
autocmd BufWrite * :Autoformat

nnoremap <leader>c :!cargo clippy

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gy   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

"************nvim-lsp 插件配置 end *************

"************vimspector插件配置 start *************
" let g:vimspector_enable_mappings = 'HUMAN'
" nmap <leader>dd :call vimspector#Launch()<CR>
" nmap <leader>dx :VimspectorReset<CR>
" nmap <leader>de :VimspectorEval
" nmap <leader>dw :VimspectorWatch
" nmap <leader>do :VimspectorShowOutput
" let g:vimspector_install_gadgets = [ 'CodeLLDB' ]
"************vimspector插件配置 end *************
